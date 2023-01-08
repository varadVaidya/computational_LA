using LinearAlgebra

function swap_rows(M,i,j)
    # for k in 1:size(M)[2]
    #     M[i,k],M[j,k] = M[j,k],M[i,k]
    # end

    M[i,:],M[j,:] = M[j,:],M[i,:]
end


function lu_full(M)
    temp_M = copy(M)
    n,m = size(temp_M)

    L = Array{Float64,2}(undef,n,0) # define L as a matrix with n rows and 0 columns, to add columns
    U = Array{Float64,2}(undef,0,n) # define U as a matrix with 0 rows and n columns, to add rows   


    P = zeros(n,n) + I # n x n identity matrix.
    esp = 1e-8

    for k in 1:n
        C = temp_M[:,k] #kth column
        # if a column is full of zero, change the zero of the current iteration to one, and continue with the algorithm.
        if maximum(abs.(C)) <= esp ## check if the largest element is close to zero.
            C = 0 * C
            C[k] = 1
            R = temp_M[k,:]'

        else
            # now we know that one of the value of the kth column is zero. so now we shift the row with highest value in the column, to the topmost row.
            # will help to make the algorithm numerically stable.
            
            max_row_index = argmax(abs.(C))
            # swap the rows :: k <----> max_row_index of
            # P matrix, temp_M matrix, and L (if L is not empty)
            # P[[k,max_row_index],:] = P[[max_row_index,k],:]
            P[k,:],P[max_row_index,:] = P[max_row_index,:],P[k,:]
            temp_M[k,:],temp_M[max_row_index,:] = temp_M[max_row_index,:],temp_M[k,:]

            # check if L is empty, which means, on the second iteration.
            if k>1
                swap_rows(L,k,max_row_index)
            end
            # need to resample rows, beacuse of the shuffing done prior.
            C = temp_M[:,k]
            pivot = C[k]

            C = C/pivot
            R = temp_M[k,:]'
            
            
        end
        temp_M = temp_M - C*R
        L = [L C]
        U = [U;R]

    end


    return L,U,P
end

if abspath(PROGRAM_FILE) == @__FILE__ 

    M = [6 -2 4 4; 3 -1 8 10;3 -1 2 8;3 -1 -1 20]
    L,U,P = lu_full(M)
    @show M
    @show L
    @show U
    @show P

end


