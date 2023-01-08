import numpy as np

def swap_rows(A,i,j):
    A[[i,j]] = A[[j,i]]
    return A

def lu_full(M):
    temp_M = np.copy(M)
    n = len(temp_M)
    
    L = np.zeros((n,n))
    U = np.zeros((n,n))
    P = np.eye(n)
    eps = 1e-8
    
    for k in range(n):
        C = temp_M[:,k] # kth column
        
        if np.max(abs(C)) <= eps:
            C = 0 * C
            C[k] = 1
            R = temp_M[k]
            
        else:
            max_row_index = np.argmax(abs(C))

            swap_rows(P, k, max_row_index)
            swap_rows(temp_M, k,max_row_index)

            if k>0:
                swap_rows(L, k, max_row_index)
            
            C = temp_M[:,k]
            pivot = C[k]
            
            C = C/pivot
            R = temp_M[k]
        
        temp_M = temp_M - np.outer(C,R)
        L[:,k] = C
        U[k] = R
    
    return L, U, P

if __name__ == "__main__":
    
    M = np.array([
        [6,-2,4,4],
        [3,-1,8,10],
        [3,-1,2,8],
        [3,-1,-1,20]
    ])
    
    L,U,P = lu_full(M)
    print("L:", L ,"\n U",U,"\n P",P)
    
    temp_result = np.dot(P,M) - np.dot(L,U)
    print("temp_result:",temp_result)
    
