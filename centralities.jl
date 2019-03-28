import Statistics
"""
    degree_centrality(idxs)

Returns an array with the number of neighbours for each node.

# Example

    import NearestNeighbors
    data = rand(2,500)
    tree = NearestNeighbors.KDTree(data)
    idxs = NearestNeighbors.inrange(tree, data, 0.1)
    centralities = DiscreteModalClustering.degree_centrality(idxs)
"""
function degree_centrality(idxs)
    return map(i -> size(i,1), idxs)
end

"""
    The reciprocal max distance is a proxy for the density estimate based on the
    volume of the ball enclosing the knn. It is ordered like the density and can 
    thus be used for maximum search
"""
function maximum_distance_centrality(dists)
    return 1 ./ map(maximum, dists)
end

function rmse(dists)
    @assert size(dists,2) == 1
    return sqrt(sum(dists.^2)/size(dists,1))
end

function rmse_centrality(dists)
    return 1 ./ map(rmse, dists)
end

function mean_distance_centrality(dists)
    return 1 ./ map(Statistics.mean, dists)
end

