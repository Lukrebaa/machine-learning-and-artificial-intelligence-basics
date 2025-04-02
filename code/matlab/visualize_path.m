function visualize_path(city_coords, path, title_str)
    figure;
    plot(city_coords(path, 1), city_coords(path, 2), '-o');
    title(title_str);
end
