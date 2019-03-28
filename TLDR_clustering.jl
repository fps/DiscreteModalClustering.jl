function degree_centrality_based_clustering(data, radius)
    tree = NearestNeighbors.KDTree(data)
    idxs = NearestNeighbors.inrange(tree, data, radius)
    centralities = DiscreteModalClustering.degree_centrality(idxs)
    assignments = DiscreteModalClustering.clustering(idxs, centralities)
    return assignments,unique(assignments)
end

function rmse_centrality_based_clustering(data, k)
    idxs,dists = knn_search(data, k)
    centralities = DiscreteModalClustering.rmse_centrality(dists)
    assignments = DiscreteModalClustering.clustering(idxs, centralities)
    return assignments,unique(assignments)
end

function mean_distance_centrality_based_clustering(data, k)
    idxs,dists = knn_search(data, k)
    centralities = DiscreteModalClustering.mean_distance_centrality(dists)
    assignments = DiscreteModalClustering.clustering(idxs, centralities)
    return assignments,unique(assignments)
end

function maximum_distance_centrality_based_clustering(data, k)
    idxs,dists = knn_search(data, k)
    centralities = DiscreteModalClustering.maximum_distance_centrality(dists)
    assignments = DiscreteModalClustering.clustering(idxs, centralities)
    return assignments,unique(assignments)
end

function kernel_density_knn_clustering1(data, kernel, k)
    idxs,dists = knn_search(data, k)
    densities = zeros(size(idxs,1))
    
end

function plot_data_and_clustering(data, assignments)
    centers = unique(assignments)
    p = Plots.scatter(data[1,:], data[2,:], markersize=2, label="data"); 
    for index=1:size(centers,1); 
        idxs = findall(x -> x == centers[index], assignments); 
        p = Plots.scatter!(data[1,idxs], data[2,idxs], markersize=3, label="cluster $(index)"); 
        center = data[:, centers[index]]
        p = Plots.scatter!(center[1,:], center[2,:], markersize=5, label="mode $(index)"); 
    end

    display(p)
end


