
include("functions.jl")
using  LinearAlgebra, Plots


#Defining Parameters:
β = 0.98 # Discount rate
μ = 1.5  # Elasticity of intertemporal substitution
η = 1    # Utility parameter
ρ = 0.6  # Autocorrelation
σ = 0.3  # Variance
δ = 0.08 # Depreciation rate
Z= 19.12048323273413 # Productivity level (not used)

fast = false #Used to get the policy functions faster, assuming we know the equilibrium r and w

amin = -0.0   # Debt limit
amax= 0.05    # Debt limit

nE = 5  # Number of states for e
nA = 80 # States for assets

r= (1/β - 1)-0.0001

w=  1

#Defining grids

pdfE,E = Tauchen(ρ,σ,nE)    #E comes from Tauchen method
A = range(amin,stop = amax, length = nA) #Half points will be in the first third of the grid


λ,r,w, policy_a, policy_c, policy_l,k,n = ayiagary(A,E,r,w,β,η,μ,Z,fast)


plot(A,[policy_c[:,3],policy_c[:,5]], legend = :bottomright ,
labels = ["Medium e" "High e"])
savefig("figure1")

plot(A,[A,A[policy_a[:,1]],A[policy_a[:,4]],A[policy_a[:,5]]],legend = :bottomright ,
labels = ["45 degrees" "Low e" "Medium e" "High e"])
maximum(policy_a)
savefig("figure2")

λ1 = zeros(nA,nE)

i=1
for a=1:nA
    global i
    for e=1:nE
        λ1[a,e] = λ[i]
        i+=1
    end
end


plot(A, sum(λ1,dims=2) )
savefig("figure3")
