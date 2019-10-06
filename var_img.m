function output_var = var_img(f)
% 对f求方差
f = double(f);
% 首先判断两个输入图像的大小是否满足关系
mean_f = mean_img(f);
output_var = mean2((f - mean_f).^2);
end