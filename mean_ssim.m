function mean_score = mean_ssim(f,g,window_size)
if nargin == 2
    window_size = 11;
end
% 根据原文的方式计算SSIM 使用高斯核
f = double(f);
g = double(g);

% 算法参数设定
K1 = 0.01;
K2 = 0.03;
C1 = (K1*255)^2;
C2 = (K2*255)^2;
C3 = C2 * 0.5;

window = fspecial('gaussian', window_size, 1.5);
window = window/sum(sum(window)) ; % 滤波器参数归一化 
% 用卷积的方式做平均，不Padding 得到的结果还是一个矩阵
mean_f = filter2(window, f, 'valid');
mean_g = filter2(window, g, 'valid');
mean_f2 = mean_f.*mean_f;
mean_g2 = mean_g.*mean_g;
mean_fg = mean_f.*mean_g;

var_f = filter2(window, f.*f, 'valid') - mean_f2;
var_g = filter2(window, g.*g, 'valid') - mean_g2;
std_fg = filter2(window, f.*g, 'valid') - mean_fg;


% 整体公式
numerator = (2*mean_f.*mean_g + C1).*(2*std_fg+C2);
denumerator = (mean_f2 + mean_g2 + C1).*(var_f + var_g + C2);
score_matrix = numerator ./ denumerator;

% % luminance contrast structure分开的公式
% std_f = sqrt(var_f);
% std_g = sqrt(var_g);
% luminance = (2*mean_f.*mean_g + C1) ./ (mean_f2 + mean_g2 + C1);
% contrast = (2*std_f.*std_g + C2) ./ (var_f + var_g + C2);
% structure = (std_fg + C3) ./ (std_f.*std_g + C3);
% 
% score_matrix_individual = luminance .* contrast .* structure;
% disp(mean2(score_matrix_individual));

mean_score = mean2(score_matrix);
end