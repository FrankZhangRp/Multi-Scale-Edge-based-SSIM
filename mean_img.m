function output_mean = mean_img(f)
dim_img = ndims(f);

% 灰度图直接处理
if dim_img == 2
    output_mean = mean2(f); 
end
% 对于彩色图 转成灰度图处理
if dim_img == 3
    gray_f = rgb2gray(uint8(f));
    output_mean = mean2(gray_f);

end

end

