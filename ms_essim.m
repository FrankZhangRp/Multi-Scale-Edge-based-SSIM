function score = ms_essim(f,g, edge_type)
% multi scaleµÄedge ssim
if nargin == 2
    edge_type = 'robert';
end
if size(f) == size(g)
    [h, w] = size(f);
    multi_scale = floor(log2(h) - 3);
    score_vector = zeros([multi_scale, 1]);
    window_size = h;
    for i=1:5
        score_vector(i) = edge_ssim(f, g, window_size, edge_type);
        window_size = round(window_size / 2);
    end
    score = mean(score_vector);

else
    error('size f != size g');
end

end