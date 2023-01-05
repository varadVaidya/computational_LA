using LinearAlgebra

function lu_noPermutation(M)
    ## init
    temp_M = copy(M)

    n = size(temp_M)[1] 

    L = Array{Float64,2}(undef,(n,0)) # define L as a matrix with n rows and 0 columns, to add columns
    U = Array{Float64,2}(undef,(0,n)) # define U as a matrix with 0 rows and n columns, to add rows   


    for i = 1:n
        pivot = temp_M[i,i]

        if ! isapprox(pivot,0.0,atol=1e-8)
            C = temp_M[:,i]./pivot
            R = temp_M[i,:]'
            
            L = [L C]
            U = [U;R]

            @show temp_M = temp_M - C * R

        else
            println("M has 0 in its pivot")
            break
        end
    end
    
    return L,U
    
end

@show M = [-2 -4 -6;-2 1 -4;-2 11 -4]

L, U = lu_noPermutation(M)

@show L
@show U
