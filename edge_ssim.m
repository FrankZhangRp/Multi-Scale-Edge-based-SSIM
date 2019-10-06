function mean_score = edge_ssim(f, g, window_size, edge_type)
% ��mean_ssim�Ļ����ϸı�structure������Ϊ��Ե��ȡ����
if nargin == 2
    window_size = 11;
    edge_type = 'robert';
end
% ����ԭ�ĵķ�ʽ����SSIM ʹ�ø�˹��
f = double(f);
g = double(g);

% �㷨�����趨
K1 = 0.01;
K2 = 0.03;
C1 = (K1*255)^2;
C2 = (K2*255)^2;
C3 = C2 * 0.5;
alpha = 1;
beta = 2;
gama = 2;

window = fspecial('gaussian', window_size, 1.5);
window = window/sum(sum(window)) ; % �˲���������һ�� 
% �þ���ķ�ʽ��ƽ������Padding �õ��Ľ������һ������
mean_f = filter2(window, f, 'valid');
mean_g = filter2(window, g, 'valid');
mean_f2 = mean_f.*mean_f;
mean_g2 = mean_g.*mean_g;
mean_fg = mean_f.*mean_g;

var_f = filter2(window, f.*f, 'valid') - mean_f2;
var_g = filter2(window, g.*g, 'valid') - mean_g2;
std_fg = filter2(window, f.*g, 'valid') - mean_fg;

% ��Եͼ����
edge_f = img2edge(uint8(f),edge_type);
edge_g = img2edge(uint8(g),edge_type);
edge_f = double(edge_f);
edge_g = double(edge_g);
mean_ef = filter2(window, edge_f, 'valid');
mean_eg = filter2(window, edge_g, 'valid');
mean_ef2 = mean_ef .* mean_ef;
mean_eg2 = mean_eg .* mean_eg;
mean_efg = mean_ef .* mean_eg;
var_ef = filter2(window, edge_f.*edge_f, 'valid') - mean_ef2;
var_eg = filter2(window, edge_g.*edge_g, 'valid') - mean_eg2;
std_ef = sqrt(var_ef);
std_eg = sqrt(var_eg);
std_efg = filter2(window, edge_f.*edge_g, 'valid') - mean_efg;

% luminance contrast structure�ֿ��Ĺ�ʽ
std_f = sqrt(var_f);
std_g = sqrt(var_g);
luminance = (2*mean_f.*mean_g + C1) ./ (mean_f2 + mean_g2 + C1);

% contrast���� ���ñ�Ե��ȡ��ʾ
% contrast = (2*std_f.*std_g + C2) ./ (var_f + var_g + C2);
contrast = (2*std_ef.*std_eg + C2) ./ (var_ef + var_eg + C2);

% structure���� ���ñ�Ե��ȡ��ʾ
structure = (std_efg + C3) ./ (std_ef.*std_eg + C3);
% structure = (std_fg + C3) ./ (std_f.*std_g + C3);
score_matrix = (luminance.^alpha) .* (contrast.^beta) .* (structure.^gama);
mean_score = mean2(score_matrix);
end