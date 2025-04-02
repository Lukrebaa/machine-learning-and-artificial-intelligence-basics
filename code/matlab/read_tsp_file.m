function [distance_matrix, city_coords] = read_tsp_file(filename)
    % Open the file
    fid = fopen(filename, 'r');
    
    city_coords = [];
    while ~feof(fid)
        line = fgetl(fid);
        % Check if the line starts with a digit (assuming city data starts with an index)
        if ~isempty(line) && isstrprop(line(1), 'digit')
            values = sscanf(line, '%f %f %f');
            city_coords = [city_coords; values(2:3)'];
        end
    end
    fclose(fid);
    
    n = size(city_coords, 1);
    distance_matrix = zeros(n, n);
    for i = 1:n
        for j = 1:n
            if i ~= j
                distance_matrix(i, j) = norm(city_coords(i, :) - city_coords(j, :));
            end
        end
    end
end

