
filename = "C:\Users\ARRF\Desktop\Rebeka\matlab\Mid-term\data\DS1\DS1.tsp";
[distance_matrix, city_coords] = read_tsp_file(filename);


%BFS
max_iterations_bfs=10000;
profile on -memory;
tic;
[best_cost_bfs, best_path_bfs] = bfs(distance_matrix, max_iterations_bfs);
bfs_time = toc;
profile off;
p = profile('info');
bfs_memory = sum([p.FunctionTable.PeakMem]);
disp(['BFS Memory Used: ', num2str(bfs_memory), ' bytes']);
profile clear;
disp(['BFS Best Cost: ', num2str(best_cost_bfs)]);
disp(['BFS Execution Time: ', num2str(bfs_time), ' seconds']);

%DFS
max_iterations_dfs=10000;
tic;
profile on -memory;
[best_cost_dfs, best_path_dfs] = dfs(distance_matrix,max_iterations_dfs);
dfs_time = toc;
profile off;
p = profile('info');
dfs_memory = sum([p.FunctionTable.PeakMem]);
disp(['DFS Memory Used: ', num2str(dfs_memory), ' bytes']);
profile clear;
disp(['DFS Best Cost: ', num2str(best_cost_dfs)]);
disp(['DFS Execution Time: ', num2str(dfs_time), ' seconds']);


%HC
num_iterations_hc = 10000;
tic;
profile on -memory;
[best_cost_hc, best_path_hc] = hill_climbing(distance_matrix, num_iterations_hc);
hc_time = toc;
profile off;
p = profile('info');
hc_memory = sum([p.FunctionTable.PeakMem]);
disp(['HC Memory Used: ', num2str(hc_memory), ' bytes']);
profile clear;
disp(['Hill Climbing Best Cost: ', num2str(best_cost_hc)]);
disp(['Hill Climbing Execution Time: ', num2str(hc_time), ' seconds']);


%SA
initial_temperature = 100;
cooling_rate = 0.995;
num_iterations_sa = 10000;
tic;
profile on -memory;
[best_cost_sa, best_path_sa] = simulated_annealing(distance_matrix, initial_temperature, cooling_rate, num_iterations_sa);
sa_time = toc;
profile off;
p = profile('info');
sa_memory = sum([p.FunctionTable.PeakMem]);
disp(['SA Memory Used: ', num2str(sa_memory), ' bytes']);
profile clear;
disp(['Simulated Annealing Best Cost: ', num2str(best_cost_sa)]);
disp(['Simulated Annealing Execution Time: ', num2str(sa_time), ' seconds']);



if ispc
    user_memory = memory;
    disp(['Memory Used: ', num2str(user_memory.MemUsedMATLAB), ' bytes']);
end


visualize_path(city_coords, best_path_bfs, 'BFS Solution');
visualize_path(city_coords, best_path_hc, 'Hill Climbing Solution');
visualize_path(city_coords, best_path_sa, 'Simulated Annealing Solution');
visualize_path(city_coords, best_path_dfs, 'DFS Solution');

