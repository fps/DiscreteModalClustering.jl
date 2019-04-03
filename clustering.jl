#function clustering(idxs, centralities)
#    assignments = collect(1:size(idxs,1))
#
#    while true
#        old_assignments = copy(assignments)
#        for index = 1:size(idxs,1)
#            if size(idxs[index],1) == 0
#                continue
#            end
#            current_assignment = assignments[index]
#            new_critical_index = findmax(centralities[idxs[current_assignment]])[2]
#            assignments[index] = idxs[current_assignment][new_critical_index]
#        end
#        if old_assignments == assignments
#            break
#        end
#    end
#    return assignments
#end
#
function clustering_step(idxs, centralities)
    assignments = collect(1:size(idxs,1))
    for index = 1:size(idxs,1)
        @assert index in idxs[index]
        if size(idxs[index],1) == 0
            continue
        end
        new_critical_index = findmax(centralities[idxs[index]])[2]
        assignments[index] = idxs[index][new_critical_index]
    end
    return assignments
end

function clustering(idxs, centralities)
    assignments = clustering_step(idxs, centralities)
    
    max_step = 100
    
    step = 1
    while true
        old_assignments = copy(assignments[:, step])
        new_assignments = copy(assignments[:, step])
        # display(new_assignments)
        
        #for index = 1:size(idxs,1)
        #    old = old_assignments[index]
        #    new = old_assignments[old]
        #    new_assignments[index] = new
        #end
        
        new_assignments = old_assignments[old_assignments]
        
        #display(new_assignments == old_assignments)
        
        if new_assignments == old_assignments
            break
        end
        
        if step > max_step
            break
        end
        
        assignments = hcat(assignments, new_assignments)
        
        step += 1
    end
    
    return assignments
end
