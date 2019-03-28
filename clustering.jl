function clustering(idxs, centralities)
    assignments = collect(1:size(idxs,1))

    while true
        old_assignments = copy(assignments)
        for index = 1:size(idxs,1)
            if size(idxs[index],1) == 0
                continue
            end
            current_assignment = assignments[index]
            new_critical_index = findmax(centralities[idxs[current_assignment]])[2]
            assignments[index] = idxs[current_assignment][new_critical_index]
        end
        if old_assignments == assignments
            break
        end
    end
    return assignments
end
