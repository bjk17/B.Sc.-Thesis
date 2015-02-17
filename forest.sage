#
# Given a permutation w and a pattern p we define a graph G = G(w,p) such that
# the vertices of G are occurrences of the pattern p in w. Two vertices are
# connected by an edge if and only if the corresponding occurrences differ by
# exactly one point in w
#

def occurrence_graph(w, p):
    V = map(tuple, w.pattern_positions(p))
    return Graph([ V, lambda v, u : len(list( set(v)-set(u) )) == 1 ])


# Counting occurences of trees of length k in G_p(w) 
# where p=12

N = 8
p = [1,2]

for n in range(1,N+1):
    L = [0]*n #list of length n initialised to 0
    for w in Permutations(n):
        og = occurrence_graph(w, p)
        if og.is_tree():
            k = og.order() # |V| nr. of vertices
            L[k] = L[k]+1
    print L[::-1]
