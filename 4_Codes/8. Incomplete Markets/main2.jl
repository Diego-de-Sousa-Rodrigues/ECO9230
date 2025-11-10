
include("functions2.jl")
using  LinearAlgebra, Plots


#Defining Parameters:

β = 0.98 # Discount rate
μ = 1.5  # Elasticity of intertemporal substitution
η = 1    # Utility parameter
ρ = 0.6  # Autocorrelation
σ = 0.3  # Variance
δ = 0.08 # Depreciation rate
θ = 0.3  # Capital Share
Z=1      # Productivity level

fast = false #Used to get the policy functions faster, assuming we know the equilibrium r and w

amin = -0.0   # Debt limit
amax= 0.03    # Capital limit

nE = 5  # Number of states for e
nA = 80 # States for assets

r= (1/β - 1)-0.0001 #initial guess for r liens in the interval (-δ, 1/β-1)

Kguess = ((r+δ)/(Z*θ))^(1/(θ-1)) # K for the nitial guess of r
w=  (1-θ)*Z*Kguess^θ  # Initial wage given r0
Nguess = (w/(Z*(1-θ)))^(-1/θ)*Kguess


#Defining grids

pdfE,E = Tauchen(ρ,σ,nE)    # E comes from Tauchen method
A = range(amin,stop = amax, length = nA) # Half points will be in the first third of the grid


λ,r,w, policy_a, policy_c, policy_l,k,n,Y,K = ayiagary(A,E,r,w,β,η,μ,Z,fast)
Y

plot(A,[policy_c[:,3],policy_c[:,5]])
savefig("figure11")


plot(A,[A,A[policy_a[:,1]],A[policy_a[:,4]],A[policy_a[:,5]]],legend = :bottomright ,
labels = ["45 degrees" "Low e" "Medium e" "High e"])
maximum(policy_a)
savefig("figure12")


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
savefig("figure13")
