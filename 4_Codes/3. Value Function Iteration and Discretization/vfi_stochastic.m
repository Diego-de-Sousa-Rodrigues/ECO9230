% Topics in Macroeconomics
% Canonical RBC Model with No Labour and No Investment Constraint
% STOCHASTIC MODEL
% Equations:
% V(k,z) = max_{c,k'} ln(c) + beta*V(k',z')
% where
% c + k' = z*k^(alpha) + (1-delta)*k
% c>=0 and k'>=0
% SOLUTION METHOD: VALUE FUNCTION ITERATION (Discretisation)
% Diego de Sousa Rodrigues
% Fall 2025

clear all 

%% Define Preliminaries

% Parameters
alpha = 0.36;   % Capital Share in Production Function
beta  = 0.99;   % Discount Factor
delta = 0.025;  % Depreciation Rate
rho   = 0.99;   % Persistence of Technology Shock
sigma = 0.007;  % Standard Deviation of Technology Shock

% Utility Function
u = @(ct) log(ct);

% Production Function
F = @(kt,zt) zt*kt^(alpha);

% Define the Steady State
z_ss = 1;                           % Steady State Technology Shock
k_ss = (alpha/((1/beta) - (1-delta)))^(1/(1-alpha));  % Steady State Capital Stock
y_ss = F(k_ss,z_ss);                % Steady State Output
c_ss = y_ss - delta*k_ss;           % Steady State Consumption

%% Define the Grid for the Endogenous State Variable: Capital
nk = 101;                            % Number of Grid Points
kmin = 0.2*k_ss; kmax = 1.8*k_ss;    % Bounds for Grid
kg = [kmin:(kmax-kmin)/(nk-1):kmax]; % Equally Spaced Grid for Capital

%% Define the Grid for the Exogenous State Variable: Technology Shock
% USE TAUCHEN TO DISCRETISE THIS GRID (see PS1, Q5)
r = 3;
nz = 9;

%Markov process
[P,zg]=markovappr(rho,sigma,r,nz);                      % Transition matrix
zg=exp(zg);                                             % Shocks
%



%% Build the 3-Dimensional Contemporaneous Utility Grid for the System
% Within it, ensure that capital and consumption never go negative

Ut = zeros(nk,nk,nz);

for kk = 1:nz           % Loop Over Technology Today
    for ii = 1:nk       % Loop Over Capital Today
        for jj = 1:nk   % Loop Over Capital Tomorrow
            z = zg(kk);     % Technology Today
            k = kg(ii);     % Capital Today
            kp = kg(jj);    % Capital Tomorrow
            % Solve for Consumption at Each Point
            c = F(k,z) + (1-delta)*k - kp;
            if (kp < 0)||(c < 0)
                % If Tomorrow's Capital Stock or Today's Consumption is Negative
                Ut(ii,jj,kk) = -9999999999; 
                % Numerical Trick to ensure that the Value Function is never 
                %    optimised at these pointselse
            else
                Ut(ii,jj,kk) = u(c);     
                % Calculate Utility at this Point on Grid
            end
        end
    end
end

%% Value Function Iteration

% Initial Guess of the Value Function
V0 = kron(zg,ones(nk,1));   % zg is 1 x nz and ones(nk,1) is nk x 1
                            % V0 is nk x nz

% Calculate the Guess of the Expected Value Function
for kk = 1:nz
    EVF(:,kk) = V0*P(kk,:)';    % (nk x nz)*(nx x 1), so EVF is (nk x nz)
end

% Value Function Iteration
tol  = 0.0001;
err  = 2;
iter = 0;

while err > tol
    for kk = 1:nz   % Loop over Today's Technology Shock
        % Here have used Kronecker product to save a loop over capital
        %   today and tomorrow
        Objgrid = Ut(:,:,kk) + beta*kron(ones(nk,1),EVF(:,kk)'); % Kron gives nk x nk
        for ii = 1:nk   
            % Loop Over Today's Capital Stock to find max of Value Function
            [V1(ii,kk),PF(ii,kk)] = max(Objgrid(ii,:));
        end
    end
    
    for kk = 1:nz    
        % Loop over Today's Technology to Solve for Expected Value Function
        EVF(:,kk) = V1*P(kk,:)';
        % To be used as the next guess for the value function
    end
    
    iter = iter + 1;
    err  = norm(V1(:) - V0(:));
    iter10 = mod(iter,10);
    if iter10 == 0
        display(['Number of Iterations ',num2str(iter)]);
    end
    V0   = V1;
end

%% Build Policy Function for Consumption
CF = zeros(size(PF));

for i = 1:nz
    for j = 1:nk
        k  = kg(j);         % Capital Today
        kp = kg(PF(j,i));   % Capital Tomorrow
        z  = zg(i);         % Technology Today
        
        % Solve for Consumption
        CF(j,i) = F(k,z) + (1-delta)*k - kp;
        yF(j,i) = F(k,z)
        iF(j,i)=yF(j,i)-CF(j,i);
    end
end

%% Plot the Policy Function
fig1 = figure('units','normalized','outerposition',[0 0 0.8 1])
    set(fig1,'Color','white','numbertitle','off','name','Policy Function - Capital')
    plot(kg,kg(PF(:,1)),'k-.','LineWidth',1)
    hold on
    plot(kg,kg(PF(:,5)),'k','LineWidth',2)
    hold on
    plot(kg,kg(PF(:,9)),'k--','LineWidth',2)
    hold on
    plot(kg,kg,'k:','LineWidth',1)
    hold off
    legend('Policy Function (Z = 0.89)','Policy Function (Z = 1)','Policy Function (Z = 1.11)','45-degree Ray','FontSize',8,'Orientation','Vertical','Location','SouthEast')
    xlabel('k Today','FontSize',8)
    ylabel('k Tomorrow','FontSize',8)
    title('Capital Policy Function')
%%  Simulate time path for variables
T=120;  % Number of periods for simulation
k_path = zeros(T,1);
c_path = zeros(T,1);
y_path = zeros(T,1);
i_path = zeros(T,1);
z_path = zeros(T,1);

S = markov(T,P);        % produces shock realization using function IID
i = round(ceil(nk/2)); % produces the initial value for k (taking the middle point of the grid, or the one next to)

for t = 1:T
    for n = 1:length(zg)
        if S(t) == n
            k_path(t+1) = kg(PF(i,n));
            c_path(t)   = CF(PF(i,n));
            y_path(t)   = yF(PF(i,n));
            i_path(t)   = iF(PF(i,n));
            i           = find(kg == k_path(t+1));
        end
    end
end

disp('  ')
disp(' ********************* PLOTTING SIMULATED TIME PATH ************************* ')
disp('  ')
% Plot a simulation
figure(2)
plot([k_path(2:T), c_path(2:T), y_path(2:T)])
hold on
plot([k_ss*ones(T-1,1), c_ss*ones(T-1,1), y_ss*ones(T-1,1)],':')
title('Simulation of time path')
legend('k_t','c_t','y_t')
hold off



%% Repeating simulations to get statistics

%warning off  % this avoids warning messages for the repetition of simulations

disp(' ********************* GETTING STATISTICS *********************************** ')
disp('  ')
Ns=1000;

sd = zeros(Ns,4);
rd = zeros(Ns,4);

for q = 1:Ns
    k_path_s = zeros(T,1);
    c_path_s = zeros(T,1);
    y_path_s = zeros(T,1);
    i_path_s = zeros(T,1);
    z_path_s = zeros(T,1);

    S = markov(T,P);        % produces shock realization using function IID
    i = round(ceil(nk/2));  % produces the initial value for k (taking the middle point of the grid, or the one next to)


    for t = 1:T
        for n = 1:length(zg)
            if S(t) == n
            k_path_s(t+1) = kg(PF(i,n));
            c_path_s(t)   = CF(PF(i,n));
            y_path_s(t)   = yF(PF(i,n));
            i_path_s(t)   = iF(PF(i,n));
            i           = find(kg == k_path(t+1));
            end
        end
    end
    
    sd(q,:) = std([k_path_s(2:T), c_path_s(2:T), y_path_s(2:T), i_path_s(2:T)]); % remove initial value
    rd(q,:) = sd(q,:)/sd(q,3);
end

average_sd = mean(sd);
average_rd = mean(rd);

disp('  ')   
disp(' The average standard deviations for the three variables are:')
disp('        k        c        y       i                                  ') 
disp(average_sd)
disp('  ')
disp(' The relative standard deviations for the three variables are:')
disp('        k        c        y        i                           ') 
disp(average_rd)

%warning on  % this turns on the warnings after completing the simulations

