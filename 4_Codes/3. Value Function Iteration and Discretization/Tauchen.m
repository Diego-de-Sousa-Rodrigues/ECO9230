function [P, y] = Tauchen(rho, sigma, N, mu, m)
% Tauchen  Discretize AR(1) via Tauchen (1986).
%   [P,y] = Tauchen(rho, sigma, N, mu, m)
% AR(1):  y_{t+1} = mu*(1-rho) + rho*y_t + eps,  eps ~ N(0, sigma^2)
% Inputs:
%   rho   in (-1,1)  persistence
%   sigma > 0        std dev of eps
%   N     >= 1       number of grid points
%   mu    scalar     long-run mean level
%   m     > 0        half-width in SDs for grid: y in [mu - m*sd_y, mu + m*sd_y]
% Outputs:
%   P   (N x N) row-stochastic transition matrix
%   y   (N x 1) grid

    arguments
        rho   (1,1) double
        sigma (1,1) double {mustBePositive}
        N     (1,1) double {mustBeInteger, mustBePositive}
        mu    (1,1) double
        m     (1,1) double {mustBePositive}
    end

    if N == 1
        y = mu;
        P = 1;
        return;
    end

    % Unconditional std dev of y
    sdy = sqrt(sigma^2 / (1 - rho^2));

    % Grid (equally spaced over +/- m sdy around mu)
    yN = mu + m*sdy;
    y1 = mu - m*sdy;
    Delta = (yN - y1) / (N - 1);
    y = (y1:Delta:yN)';
    
    % Midpoints for interval probabilities
    mids = (y(1:end-1) + y(2:end)) / 2;
    lb = [-inf; mids];       % lower bounds
    ub = [mids;  inf];       % upper bounds

    % For each current state i, next-state mean
    mu_next = mu*(1 - rho) + rho*y;   % N x 1

    % Compute transition probabilities
    % P(i,j) = Phi((ub(j)-mu_next(i))/sigma) - Phi((lb(j)-mu_next(i))/sigma)
    % Use implicit expansion (R2016b+) or bsxfun for older versions.
    Phi = @(x) 0.5*(1 + erf(x ./ sqrt(2)));
    Zub = (ub' - mu_next) / sigma;    % N x N
    Zlb = (lb' - mu_next) / sigma;    % N x N
    P = Phi(Zub) - Phi(Zlb);

    % Guard against tiny numeric drift
    P = max(P, 0);
    rowsum = sum(P,2);
    P = P ./ rowsum;   % ensure rows sum to 1 (row-stochastic)
end
