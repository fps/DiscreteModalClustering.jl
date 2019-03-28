function knn_search(data, k)
    tree = NearestNeighbors.KDTree(data)
    idxs,dists = NearestNeighbors.knn(tree, data, k)
    return idxs,dists
end


