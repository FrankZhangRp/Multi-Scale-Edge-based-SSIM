function [ out ] = PSNR( f, g )
rmse_value = rmse(f, g);
B = 8; % 图像深度
MAX = 2^B -1; % 图像灰度级
out = 20*log10(MAX/rmse_value);               
end

