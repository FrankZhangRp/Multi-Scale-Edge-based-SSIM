function score = ssim(f,g)
% 这里实现的是block的SSIM操作
mean_f = mean_img(f);
mean_g = mean_img(g);
std_f = sqrt(var_img(f));
std_g = sqrt(var_img(g));
convar_fg = convar_img(f,g);
k1 = 0.01;
k2 = 0.03;
c1 = (k1*255)^2;
c2 = (k2*255)^2;
c3 = c2 * 0.5;
% Luminance
l_fg = (2*mean_f*mean_g + c1) / (mean_f^2 + mean_g^2 + c1);

% contrast
c_fg = (2*std_f*std_g + c2) / (std_f^2 + std_g^2 + c2);

% structure
s_fg = (convar_fg + c3) / (std_f*std_g +c3);

score = l_fg * c_fg * s_fg;
end