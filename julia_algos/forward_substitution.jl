using LinearAlgebra

function forwardsub(L,b)
    # L is lower triangular matrix

    if minimum(abs.(diag(L))) < 1e-6
        return false
    end

    n = length(b)
    x  = Vector{Float64}(undef,n)

    x[1] = b[1]/L[1,1]

    for i = 2:n
        x[i] = (b[i] - L[i,1:i]' * x[1:i])/L[i,i]
    end

    return x
end

L = [3 0 0;2 -1 0;1 -2 3]
b = [6,-2,2]

@show x = forwardsub(L,b)
