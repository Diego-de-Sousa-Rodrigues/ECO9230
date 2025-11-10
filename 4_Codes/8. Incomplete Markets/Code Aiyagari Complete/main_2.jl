include("functions_2.jl")
using  LinearAlgebra, Plots
using  JLD2,FileIO


#Defining Parameters:
β = 0.98 #Discount rate
μ = 1.5  #Elasticity of intertemporal substitution
η = 0.3 #Utility parameter
τy = 0.4 #Income tax
ρ = 0.6 #Autocorrelation
σ = 0.3 #Variance
δ = 0.075 #Depreciation rate
θ = 0.3 #Capital Share
T=0.1 #Transfers
G = 0.2 #Expenses Government
Z=18.338432770675855 #Productivity level (Set so that the GDP = 1)

fast = false # Used to get the policy functions faster, assuming we know the equilibrium r and w
#In this case we do not know so we set it to false

amin = -0.0   #Debt limit
amax= 13.0 #Capital limit

nE = 5  #Number of states for e
nA = 500 #Number of states for assets,a

r= (1/β - 1)-0.0001 #initial guess for r liens in the interval (-δ, 1/β-1) as in class

Kguess = ((r+δ)/(Z*θ))^(1/(θ-1)) #K for the initial guess of r
w=  (1-θ)*Z*Kguess^θ  #Initial wage given r. As in the algorithm discusses for every r we have a w(r)
Nguess = (w/(Z*(1-θ)))^(-1/θ)*Kguess #N for the initial guess of r and w(r)


## Solving the model
pdfE,E = Tauchen(ρ,σ,nE)    #E comes from Tauchen method
A = range(amin,stop = amax, length = nA) #Half points will be in the first third of the grid

#Calibrating Z Please use this with small grid
#dist_y = 1
#while dist_y>10^-3
#    global Z, dist_y,r,Assets,E,w,K,N,policy_a, policy_c, policy_l,Y
#    @time λ,r,w, policy_a, policy_c, policy_l,K,N,Y,B,K = ayiagary(A,E,r,w,τy,T,β,η,μ,Z,G)
#    dist_y = abs(Y-1)
#    Z =1/2*Z+1/2 * Z/Y
#    println("Y is $Y, new Z is $Z")
#end=

λ,r,w,policy_a,policy_c,policy_l,Assets,N,Y,B,K = ayiagary(A,E,r,w,τy,T,β,η,μ,Z,G,fast)

Y #GDP


## Plots of the Policy function for Assets and Consumption
plot(A,[policy_c[:,1],policy_c[:,3],policy_c[:,5]],legend = :bottomright ,
labels = ["Low e" "Medium e" "High e"]) #Policy function for consumption

plot(A,[A,A[policy_a[:,1]],A[policy_a[:,3]],A[policy_a[:,5]]],legend = :bottomright ,
labels = ["45 degrees" "Low e" "Medium e" "High e"])
maximum(policy_a) #Policy function for assets


##Ploting the distribution of agents
λ1 = zeros(nA,nE)
i=1
for a=1:nA
    global i
    for e=1:nE
        λ1[a,e] = λ[i]
        i+=1
    end
end
plot(A, sum(λ1,dims=2)) #Plotting the stationary distribution of agents
xaxis!("Assets")
yaxis!("Agents")


##Calculating the Gini
F = zeros(nA+1)
S = zeros(nA+1)
mean_wealth = 0
gini = 0

for e=2:nA+1
    global F,S,mean_wealth,gini
        F[e] = F[e-1] + sum(λ1[e-1,:])
        S[e] = S[e-1] + sum(λ1[e-1,:])*A[e-1]
        mean_wealth += A[e-1]*sum(λ1[e-1,:])

        for e1 = 1:nA
            gini += sum(λ1[e-1,:])*sum(λ1[e1,:])*abs(A[e-1]-A[e1])
        end
end
gini = 1/(2*mean_wealth) * gini
L = S./S[end]
plot(F,[L,F],legend = false, xaxis="share of population (ordered by wealth)",yaxis = "Share of wealth owned")

var_wealth = 0
for a=1:nA
    global var_wealth
    var_wealth += sum(λ1[a,:])*(A[a]-mean_wealth)^2
end

std_wealth = sqrt(var_wealth)


##Saving the results
@save "variables.jld2"  λ,r,w, policy_a, policy_c, policy_l
