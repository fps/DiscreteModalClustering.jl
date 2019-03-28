import DelimitedFiles

"""
Returns the word count data.

    nips_word_counts()

Poisson Random Fields for Dynamic Feature Models'. Perrone V., Jenkins P. A., Spano D., Teh Y. W. (2016)
"""
function nips_word_counts()
    nips = Array{Float32, 2}(DelimitedFiles.readdlm("NIPS_1987-2015.csv", ',')[2:11464, 2:5812])
end

"""
    nips_words()

Returns the counted words as strings.

Poisson Random Fields for Dynamic Feature Models'. Perrone V., Jenkins P. A., Spano D., Teh Y. W. (2016)
"""
function nips_words()
    nips = DelimitedFiles.readdlm("NIPS_1987-2015.csv", ',')[2:11464, 1]
end

"""
    nips_ids()

Returns the paper IDs.

Poisson Random Fields for Dynamic Feature Models'. Perrone V., Jenkins P. A., Spano D., Teh Y. W. (2016)
"""
function nips_ids()
    nips = DelimitedFiles.readdlm("NIPS_1987-2015.csv", ',')[1, 2:5812]
end


