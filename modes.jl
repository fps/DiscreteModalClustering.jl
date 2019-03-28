"""
    modes(idxs, centralities)

Returns an array of indices of those points that have greater centrality than their neighbours.

# Examples

    import NearestNeighbors
    import Statistics
    data = hcat(randn(2,200), 2 .+ randn(2,200))
    tree = NearestNeighbors.KDTree(data)
    idxs,dists = NearestNeighbors.knn(tree, data, 50)
    centralities = map(Statistics.mean, dists)
    centralities = 1 ./ centralities 
    modes = DiscreteModalClustering.modes(idxs, centralities)
    Plots.scatter(data[1,:], data[2,:], label="data")
    Plots.scatter!(data[1,modes], data[2,modes], label="modes")
"""
function modes(idxs, centralities)
    modes = []
    for index = 1:size(idxs,1)
        local_idxs = idxs[index]
        if size(local_idxs, 1) == 0
            continue
        end
        critical_index = reverse(sortperm(centralities[local_idxs]))[1]
        if local_idxs[critical_index] == index
            append!(modes, index)
        end
    end
    return modes
end


