import NearestNeighbors

"""
    Performs a radius search in the given data and returns the 
    indices of the points that have the greatest local degree centrality
"""
function degree_centrality_based_modes(data, radius)
    tree = NearestNeighbors.KDTree(data)
    idxs = NearestNeighbors.inrange(tree, data, radius)
    centralities = DiscreteModalClustering.degree_centrality(idxs)
    modes = DiscreteModalClustering.modes(idxs, centralities)
    return modes    
end

function rmse_centrality_based_modes(data, k)
    idxs,dists = knn_search(data, k)
    centralities = DiscreteModalClustering.rmse_centrality(dists)
    modes = DiscreteModalClustering.modes(idxs, centralities)
    return modes
end

function mean_distance_centrality_based_modes(data, k)
    idxs,dists = knn_search(data, k)
    centralities = DiscreteModalClustering.mean_distance_centrality(dists)
    modes = DiscreteModalClustering.modes(idxs, centralities)
    return modes
end

function maximum_distance_centrality_based_modes(data, k)
    idxs,dists = knn_search(data, k)
    centralities = DiscreteModalClustering.maximum_distance_centrality(dists)
    modes = DiscreteModalClustering.modes(idxs, centralities)
    return modes
end

import Plots

function plot_data_and_modes(data, modes)
    p = Plots.scatter(data[1,:], data[2,:], label="data")
    p = Plots.scatter!(data[1,modes], data[2,modes], label="modes")
    display(p)
end
