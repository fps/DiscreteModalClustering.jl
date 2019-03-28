# DiscreteModalClustering.jl
A naive implementation of some discrete approximative modal clustering algorithm variants

<code>
julia> import Plots

julia> Plots.gr()
Plots.GRBackend()

julia> include("DiscreteModalClustering.jl")
Main.DiscreteModalClustering

julia> data = hcat(randn(2,100), 3 .+ randn(2,100))
2×200 Array{Float64,2}:
 -0.940709  0.472444   -0.101116  0.261072  -0.633587   -1.07857   …  4.54723  4.68166  4.36897  3.52653  2.60418  1.89551  3.69226
  1.32727   0.0554025   0.278341  0.517826   0.0354807  -0.445128     2.74405  4.30819  1.81379  3.5382   2.73316  2.94458  3.46256

julia> a,c = DiscreteModalClustering.mean_distance_centrality_based_clustering(data, 30)
([3, 3, 3, 3, 3, 3, 3, 3, 3, 3  …  193, 193, 193, 193, 193, 193, 193, 193, 193, 193], [3, 193])

julia> DiscreteModalClustering.plot_data_and_clustering(data, a)
</code>

(https://github.com/fps/DiscreteModalClustering.jl/blob/master/plot.png "a plot")
