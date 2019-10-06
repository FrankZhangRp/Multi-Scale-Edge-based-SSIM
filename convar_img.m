function output_convar = convar_img(f,g)
% 对f和g求协方差 当f和g相同时结果为方差，要求f和g的大小一致
f = double(f);
g = double(g);
% 首先判断两个输入图像的大小是否满足关系
if ndims(f) == ndims(g)
    if size(f) == size(g)
        mean_f = mean_img(f);
        mean_g = mean_img(g);
        output_convar = mean2(f.*g) - mean_f*mean_g;
    else
        error('size f != size g');
    end
else 
    error('dim f != dim g');
end
end