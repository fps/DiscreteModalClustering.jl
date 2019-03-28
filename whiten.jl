import Statistics

function whiten(data)
    means = Statistics.mean(data, dims=2)
    vars = Statistics.var(data, dims=2)

    for index=1:size(data,1)
        data[index, :] .-= means[index]
        data[index, :] ./= vars[index]
    end

    return data
end
