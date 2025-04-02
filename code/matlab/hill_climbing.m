% Hill Climbing
function [best_cost, best_path] = hill_climbing(distance_matrix, num_iterations)
    n = size(distance_matrix, 1);
    current_path = randperm(n);
    current_cost = sum(distance_matrix(sub2ind([n, n], current_path, [current_path(2:end), current_path(1)])));
    best_path = current_path;
    best_cost = current_cost;

    for iteration = 1:num_iterations
        i = randi(n);
        j = randi(n);
        new_path = current_path;
        new_path([i, j]) = new_path([j, i]);
        new_cost = sum(distance_matrix(sub2ind([n, n], new_path, [new_path(2:end), new_path(1)])));
        
        if new_cost < current_cost
            current_path = new_path;
            current_cost = new_cost;
            
            if new_cost < best_cost
                best_path = new_path;
                best_cost = new_cost;
            end
        end
    end
end