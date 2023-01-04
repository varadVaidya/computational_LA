using LinearAlgebra

function backwardsub(U,b)
    # U is upper traingular matrix
    # b is vector with same length as U


    # Assert no entries on diagonal of U are close to zero
    if minimum(abs.(diag(U))) < 1e-6
        return false
    end

    n = length(b)
    x = Vector{Float64}(undef,n)

    # start from the end and go till the top
    x[n] = b[n]/U[n,n]

    for i = n-1: -1 : 1
        x[i] = ( b[i] - ( U[i,i+1:n]' * x[i+1:n] ) )/U[i,i]
    end

    return x
    
end


U=[ 0.955467 -0.821842 -1.24331 -0.553594 0.910181 1.20471;
0.0 -0.272776 0.376981 2.08047 -1.10505 1.05765;
0.0 0.0 0.212559 1.07301 -1.33234 2.3487;
-0.0 0.0 0.0 -0.229487 0.980719 0.336002;
-0.0 0.0 -0.0 0.0 -1.24249 -1.55205;
-0.0 0.0 0.0 0.0 -0.0 -0.793501 ];
@show U[2,:]'


b = [0.8398952455773964;
-0.8897505302659705;
0.006884706336738545;
-1.1285718398040936;
-0.011546427596053652;
-1.1135689635657877];

x = backwardsub(U,b)
println(x)
