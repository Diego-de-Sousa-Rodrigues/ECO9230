using Distributions, Optim, ApproxFun


function Tauchen(ρ,σ,Y,μ = 0,m = 3)
    #This function is to discretize an AR(1) process following Tauchen(1986) method
    #y_{t+1} = μ + ρy_t + ϵ
    #ϵ~N(0,σ^2)
    #Y is the number of y states
if Y>1
    ybar = μ/(1-ρ)
    ymax= ybar + m*(σ^2/(1-ρ^2))^(1\2) #maximum y
    ymin= ybar - m*(σ^2/(1-ρ^2))^(1\2) #minimum y

    Δ = (ymax-ymin)/(Y-1)# #distance between each y
    y=ymin:Δ:ymax #vector of possible states of p

    d=Normal()

    pdfY=ones(Y,Y) #preallocate memory and create the transition matrix in the following loop
    for i in 1:Y
        pdfY[i,1]=cdf(d,(y[1] + Δ/2 -ρ*y[i]) / σ^0.5);
        pdfY[i,Y]=1-cdf(d,(y[Y] -Δ/2 - ρ*y[i]) / σ^0.5);
        for j in 2:Y-1
            pdfY[i,j]=cdf(d,(y[j] + Δ/2 - ρ*y[i])/σ^0.5) - cdf(d,(y[j] - Δ/2 - ρ*y[i]) / σ^0.5);
        end
    end
else
    y=μ
    pdfY=1
end

    return pdfY, y
end


function utility(c,l,η,μ)
    if (c<=0) || (η<1 && l==0)
        u=-Inf
    elseif μ==1
        u = log(c^η * l^(1-η))
    else
        u = ((c^η * l^(1-η))^(1-μ) )/ (1-μ)
    end
    return u
end


function VFI(A,E,r,w,β,η,μ)

    nA = length(A)
    nE = length(E)
    u = ones(nA,nE,nA)
    policy_l1=ones(nA,nE,nA)

    #Solving the labor problem for each level of asset today and tommorow
    c(l,a,e,a1) = E[e]*w*(1-l)+(1+r)*A[a]-A[a1]
    for a=1:nA,e=1:nE,a1=1:nA
            maxu(l) = -utility(c(l,a,e,a1),l,η,μ)
            maxU = optimize(maxu, 0.0, 1.0)
            u[a,e,a1] = -maxU.minimum
            policy_l1[a,e,a1] = maxU.minimizer
    end

    #VFI
        #Initial value function guess:
        V  = ones(nA,nE)

        #preallocation
        policy_a = Array{Int64,2}(undef,nA,nE)

        #loop stuff
        distance = 1
        tol =10^(-7)

        #iterating on Value function:
        while distance >= tol
            Vf = copy(V) #save V to compare later

            EVf= transpose(pdfE*Vf') #expected value for the value function see the lecture notes
            for a in 1:nA, e in 1:nE
                V[a,e] , policy_a[a,e] = findmax(u[a,e,:] .+ β * EVf[:,e]) #Bellman Equation
            #The if below is necessary because in the worst states, consumption is negative,
            #no matter what choice of assets. So, in these cases the findmax function above would
            #choose weird values, so we set the policy functions at the initial values at the grid
                if u[a,e,policy_a[a,e]] == -Inf
                    #policy_a[a,e] = 1
                end
            end
         distance = maximum(abs.(V-Vf))
        end

        #Finally, recover the labor policy:
        policy_l = Array{Float64,2}(undef,nA,nE)
        for a in 1:nA, e in 1:nE
            policy_l[a,e] = policy_l1[a,e,policy_a[a,e]]
            #it is the policy for labor we found before, with the addition of the
            #policy function for assets
        end

        #and for consumption
            policy_c=ones(nA,nE)
        for a=1:nA,e=1:nE
            policy_c[a,e] = E[e]*w*(1-policy_l[a,e])+(1+r)*A[a]-A[policy_a[a,e]]
        end
return policy_a, policy_c, policy_l
end


function ayiagary(A,E,r0,w0,β,η,μ,Z,fast = false) #Given an initial interest rate and initial grids,
    #returns the distribution of states and policy functions, and equilibirum interest rate.
    r = r0
    w = w0
    nA = length(A)
    nE = length(E)
    dist_r = 1.0
    k = 5.0 #This is the total assets (The value for A in the lecture notes)
    K=0 #This is the capital (The value for K in the lecture notes)
    n = 1.0 #This is the total value for the hours
    policy_a, policy_c, policy_l = VFI(A,E,r,w,τy,T,β,η,μ)

    #creting a and and e grids as we had seen in the lecture notes
    X=zeros(Int64,nA*nE,2)
    i=0
    for a=1:nA,e=1:nE
            i=i+1
            X[i,1]=a
            X[i,2]=e
    end

    λ = ones(1,nA*nE).*1/(nA*nE) #initial guess for the distribution

    iterations = 0
    while max(dist_r)>10^-6
            #global dist_r
            Q=zeros(nA*nE,nA*nE)
            #Q is the Endogenous MC that takes from state x to x'. See the lecture notes to understand it better
            #This MC is used to compute the stationary distribution.
            for x=1:nA*nE, x1=1:nA*nE
                a = X[x,1]
                a1=X[x1,1]
                e = X[x,2]
                e1=X[x1,2]
                if a1 == policy_a[a,e] #Indicator function as in the lecture notes
                    Q[x,x1]=pdfE[e,e1]
                end
            end

            λ = rand(1,nA*nE) #initial guess for the distribution
            λ = λ./sum(λ)
            dist = 10

            #Iterate the Endogenous MC until convergence
            it =0
            while dist>10^-8
                        #global λ,dist,iterations
                        λ1=λ*Q
                        dist = maximum(abs.(λ1.-λ))
                        λ = copy(λ1)
                        it +=1
                        if it >1000
                            break
                        end
            end

            λ = λ./sum(λ)
            #k given λ and the policy function
            k, n, i= [0,0,0]
            for a=1:nA
                for e=1:nE
                    i =i+1
                    k = k + λ[i] * A[policy_a[a,e]] #This is the total assets (A) as in the lecture notes
                    n = n + λ[i] * E[e]*(1-policy_l[a,e]) #This is the total labor (N) as in the lecture notes
                end
            end


            K = max(k,0.0)

            #Bisection method
            r1= 1/2 * r + 1/2 * min((Z*θ*K^(θ-1)*n^(1-θ)-δ),1/β-1)

            #checking convergence
            dist_r = abs(r1-r)
            iterations += 1
            if iterations>100
                println("Reached maximum number of Iterations")
                break
            elseif fast== true
                println("We assumed that the initial guesses were correct.")
                break
            end
            println("Iteration: $iterations, r is: $r1")
            r=copy(r1)
            w = (1-θ)*Z*(((r+δ)/(Z*θ))^(1/(θ-1)))^θ #this value is obtaned using the CRS property of the Prod. function
            policy_a, policy_c, policy_l = VFI(A,E,r,w,β,η,μ)
    end
    println("r converged to $r")

    #GDP
    Y = Z*K^θ*n^(1-θ)

return  λ,r,w, policy_a, policy_c, policy_l,k,n,Y,K
end
