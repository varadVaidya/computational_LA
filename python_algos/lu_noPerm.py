import numpy as np

def lu_noPermutation(M):
    temp_M = np.copy(M)
    n = len(temp_M)
    
    L = np.zeros((n,n))
    U = np.zeros((n,n))
    
    for i in range(n):
        
        pivot = temp_M[i,i]
        if not np.isclose(pivot,0,atol=1e-6).any():
            C = temp_M[:,i]/pivot
            R = temp_M[i]
            temp_M = temp_M - np.outer(C,R)
            # print(temp_M)
            L[:,i] = C
            U[i] = R
            
            
        else:
            print("Matrix has 0 in its pivot")
            break
    
    return L, U

if __name__ == "__main__":
    M = np.array([
        [5,2],
        [15,2]
    ])

    L,U = lu_noPermutation(M)
    print("L:", L ,"\n U",U)