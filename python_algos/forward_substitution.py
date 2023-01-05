import numpy as np

def forwardsub(L, b):
    # assumes L as a lower triangluar matrix.
    if min(abs(np.diag(L))) < 1e-6:
        return False
    
    n = len(b)
    x = np.empty(n)

    x[0] = b[0]/L[0,0]

    for i in range(1,n):
        x[i] = (b[i] - L[i,0:i].dot(x[0:i]) )/L[i,i]
    
    return x

if __name__ == '__main__':
    L = np.array([
        [3,0,0],
        [2,-1,0],
        [1,-2,3]
    ])
    b = np.array([6,-2,2])

    x = forwardsub(L,b)
    print("x is \n", x)
