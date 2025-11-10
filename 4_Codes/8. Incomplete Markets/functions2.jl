using Distributions, Optim, NLsolve

function Tauchen(ρ,σ,Y,μ = 0,m = 3)
    # This function is to discretize an AR(1) process following Tauchen(1986) method
if Y>1
    ybar = μ/(1-ρ)
    ymax= ybar + m*(σ^2/(1-ρ^2))^(1\2) # maximum y
    ymin= ybar - m*(σ^2/(1-ρ^2))^(1\2) # minimum y

    Δ = (ymax-ymin)/(Y-1) # distance between each y
    y=ymin:Δ:ymax # vector of possible states of p

    d=Normal()

    pdfY=ones(Y,Y) # preallocate memory and create the transition matrix in the following loop
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
        policy_a = Array{Int64,2}(undef,nA,nE)
        distance = 1
        tol =10^(-7)
        while distance >= tol
            Vf = copy(V)

            EVf= (pdfE*Vf')'
            for a in 1:nA, e in 1:nE
                V[a,e] , policy_a[a,e] = findmax(u[a,e,:] .+ β * EVf[:,e])
                if u[a,e,policy_a[a,e]] == -Inf
                end
            end
         distance = maximum(abs.(V-Vf))
        end
        policy_l = Array{Float64,2}(undef,nA,nE)
        for a in 1:nA, e in 1:nE
            policy_l[a,e] = policy_l1[a,e,policy_a[a,e]]
        end

            policy_c=ones(nA,nE)
        for a=1:nA,e=1:nE
            policy_c[a,e] = E[e]*w*(1-policy_l[a,e])+(1+r)*A[a]-A[policy_a[a,e]]
        end
return policy_a, policy_c, policy_l
end


function ayiagary(A,E,r0,w0,β,η,μ,Z,fast = false)
    r = r0
    w = w0
    nA = length(A)
    nE = length(E)
    dist_r = 1.0
    dist_w = 1.0
    k = 5
    K=0
    n = 1.0
    policy_a, policy_c, policy_l = VFI(A,E,r,w,β,η,μ)

    #creting a and and e grids
    X=zeros(Int64,nA*nE,2)
    i=0
    for a=1:nA,e=1:nE
            i=i+1
            X[i,1]=a
            X[i,2]=e
    end

    λ = ones(1,nA*nE).*1/(nA*nE)
    iterations = 0
    while max(dist_r,dist_w)>10^-6
            Q=zeros(nA*nE,nA*nE)
            for x=1:nA*nE, x1=1:nA*nE
                a = X[x,1]
                a1=X[x1,1]
                e = X[x,2]
                e1=X[x1,2]
                if a1 == policy_a[a,e] # Indicator function
                    Q[x,x1]=pdfE[e,e1]
                end
            end
            λ = rand(1,nA*nE) # Initial guess for the distribution
            λ = λ./sum(λ)
            dist = 10
            # Iterate the MC until convergence
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
                    k = k + λ[i] * A[policy_a[a,e]]
                    n = n + λ[i] * E[e]*(1-policy_l[a,e])
                end
            end

            K = max(k,0.0)
            #Bisection method
            r1= 1/2 * r + 1/2 * min((Z*θ*K^(θ-1)*n^(1-θ)-δ),1/β-1)
            w1 =1/2 * w + 1/2* (Z*(1-θ)*K^θ*n^(-θ))


            #checking convergence
            dist_r = abs(r1-r)
            dist_w = abs(w1-w)
            iterations += 1
            if iterations>100
                println("Reached maximum number of Iterations")
                break
            elseif fast== true
                println("We assumed that the initial guesses were correct.")
                break
            end
            println("Iteration: $iterations, r is: $r1, w is: $w1")
            r=copy(r1)
            w =  copy(w1)
            policy_a, policy_c, policy_l = VFI(A,E,r,w,β,η,μ)
    end
    println("r converged to $r")
    println("w converged to $w")

    #GDP

    Y = Z*K^θ*n^(1-θ)

return  λ,r,w, policy_a, policy_c, policy_l,k,n,Y,K
end
