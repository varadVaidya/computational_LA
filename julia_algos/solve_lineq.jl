using LinearAlgebra
include("backward_substitution.jl")
include("forward_substitution.jl")
include("lu_noPerm.jl")

function solve_lineq(A,b)
    # for now assume that no row permutation is needed to solve for the factorisation of A
    L,U = lu_noPermutation(A) # get Lu factorisation.. assumesn that the matrix has the factorisation

    y = forwardsub(L,b)
    x = backwardsub(U,y)

    return x
    
end

A = [-2 -4 -6;-2 1 -4;-2 11 -4]
b = [2 3 -7]

@show x = solve_lineq(A,b)

