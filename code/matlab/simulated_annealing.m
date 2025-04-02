% Simulated Annealing
function [best_cost, best_path] = simulated_annealing(distance_matrix, initial_temperature, cooling_rate, num_iterations)
    n = size(distance_matrix, 1);
    current_path = randperm(n);
    current_cost = sum(distance_matrix(sub2ind([n, n], current_path, [current_path(2:end), current_path(1)])));
    best_path = current_path;
    best_cost = current_cost;
    temperature = initial_temperature;

    for iteration = 1:num_iterations
        i = randi(n);
        j = randi(n);
        new_path = current_path;
        new_path([i, j]) = new_path([j, i]);
        new_cost = sum(distance_matrix(sub2ind([n, n], new_path, [new_path(2:end), new_path(1)])));
        
        cost_diff = new_cost - current_cost;
        if cost_diff < 0 || (temperature > 0 && exp(-cost_diff / temperature) > rand())
            current_path = new_path;
            current_cost = new_cost;
            
            if new_cost < best_cost
                best_path = new_path;
                best_cost = new_cost;
            end
        end
        
        temperature = temperature * cooling_rate;
    end
end