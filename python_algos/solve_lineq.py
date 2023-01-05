import numpy as np
from backward_substitution import backwardsub
from forward_substitution import forwardsub
from lu_noPerm import lu_noPermutation
## use Lu factorization to solve linear equations
def solve_lineq(A, b):
    ## for now 5th Jan assume that no row permutation is needed to solve for the factorisation of A
    
    L,U = lu_noPermutation(A) # get L,U factorisation.. assumes that the matrix has the factorisation.
    
    y = forwardsub(L, b)
    x = backwardsub(U, y)
    
    return x
        
A = np.array([
    [-2,-4,-6],
    [-2,1,-4],
    [-2,11,-4]
])
b = np.array([2,3,-7])  

x = solve_lineq(A,b)
print("x is \n", x)