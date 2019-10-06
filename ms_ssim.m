function score = ms_ssim(f,g)
% multi scaleµÄssim
if size(f) == size(g)
    [h, w] = size(f);
    multi_scale = floor(log2(h) - 3);
    score_vector = zeros([multi_scale, 1]);
    window_size = h;
    for i=1:multi_scale
        score_vector(i) = mean_ssim(f, g, window_size);
        window_size = round(window_size / 2);
    end
    score = mean(score_vector);
    %{
    len_h = ceil(h/kernel_size);
    len_w = ceil(w/kernel_size);
    index_h = kernel_size * ones(len_h, 1);
    if mod(h, kernel_size) ~= 0
        index_h(len_h) = mod(h, kernel_size);
    end
    index_w = kernel_size * ones(len_w, 1);
    if mod(w, kernel_size) ~= 0
        index_w(len_w) = mod(w, kernel_size);
    end
    cell_f = mat2cell(f, index_h, index_w);
    cell_g = mat2cell(g, index_h, index_w);
    ms_score = zeros(len_h, len_w);
    for i=1:len_h
        for j=1:len_w
            ms_score(i,j) = ssim(cell_f{i,j}, cell_g{i,j});
        end
    end
    score = mean2(ms_score);
    %}
else
    error('size f != size g');
end

end