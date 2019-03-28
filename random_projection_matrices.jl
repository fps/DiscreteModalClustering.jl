function achlioptas_random_projection_matrix(rows, columns)
    m = zeros(rows,columns)
    for row=1:rows
        for column=1:columns
            r = rand()
            if r < 1/6
                m[row,column] = sqrt(3)
                continue
            end
            if r < 5/6
                continue
            end
            m[row,column] = sqrt(3)
        end
    end
    return m
end
