% DFS
function [best_cost, best_path] = dfs(distance_matrix, max_iterations)
    n = size(distance_matrix, 1);
    start_city = 1;
    stack = {struct('current_city', start_city, 'path', start_city, 'distance', 0)};
    best_cost = Inf;
    best_path = [];
    iterations = 0;
    
    while ~isempty(stack) && iterations < max_iterations
        current = stack{end};
        stack(end) = [];
        
        if length(current.path) == n
            total_distance = current.distance + distance_matrix(current.current_city, start_city);
            if total_distance < best_cost
                best_cost = total_distance;
                best_path = [current.path, start_city];
            end
            continue;
        end
        
        for next_city = 1:n
            if ~ismember(next_city, current.path)
                new_distance = current.distance + distance_matrix(current.current_city, next_city);
                new_path = [current.path, next_city];
                stack{end+1} = struct('current_city', next_city, 'path', new_path, 'distance', new_distance);
            end
        end
        
        iterations = iterations + 1;
    end
end