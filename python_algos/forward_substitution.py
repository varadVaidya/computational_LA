import numpy as np

def forward_substitution(L, b):
    # assumes L as a lower triangluar matrix.
    if min(abs(np.diag(U))) < 1e-6:
        return False
    
    n = len(b)
    x = np.empty(n)

    x[0] = b[0]/L[0,0]

    for i in range(1,n):
        print("row no: ",i)
        x[i] = (b[i] - L[i,0:i].dot(x[0:i]) )/L[i,i]
    
    return x

L = np.array([
    [],
    [],
    []
])
b = np.array([])
