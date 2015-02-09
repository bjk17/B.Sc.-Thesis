#
# Given a permutation w and a pattern p we define a graph G = G(w,p) such that
# the vertices of G are occurrences of the pattern p in w. Two vertices are
# connected by an edge if and only if the corresponding occurrences differ by
# exactly one point in w
#

def occurrence_graph(w, p):
    V = map(tuple, w.pattern_positions(p))
    return Graph([ V, lambda v, u : len(list( set(v)-set(u) )) == 1 ])


# Counting occurences of cliques of length k in G_p(w) 
# where p=12 and w is strongly increasing pattern of 
# length n

N = 15
k = 10
p = [1,2]
COUNTING = []
CALCULATED = []
by_formula = {}

for n in range(1,N+1):
    # strictly increasing patterns
    w = Permutation([1..n])
    og = occurrence_graph(w, p)
    
    # the formula are hyopthesis, proved for n<=3
    by_formula[1]  =        binomial(n,2)
    by_formula[2]  =  (n-2)*binomial(n,2)
    by_formula[3]  =  (n-2)*binomial(n,3)
    by_formula[4]  =  (n-4)*binomial(n,4)
    by_formula[5]  =  (n-4)*binomial(n,5) #wrong!?
    by_formula[6]  =  (n-6)*binomial(n,6) #CORRECT!
    by_formula[7]  =  (n-6)*binomial(n,7) #wrong!?
    by_formula[8]  =  (n-8)*binomial(n,8) #CORRECT!
    by_formula[9]  =  (n-8)*binomial(n,9) #wrong!
    by_formula[10] = (n-10)*binomial(n,10) #CORRECT!
    
    #~ comparing counts from Sage to our formula
    poly = og.clique_polynomial()
    COUNTING.append(poly[k])
    CALCULATED.append(by_formula[k])

print "k="+str(k)+":\t", COUNTING
print "calced:\t", CALCULATED