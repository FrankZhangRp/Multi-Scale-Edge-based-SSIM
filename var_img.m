function output_var = var_img(f)
% ��f�󷽲�
f = double(f);
% �����ж���������ͼ��Ĵ�С�Ƿ������ϵ
mean_f = mean_img(f);
output_var = mean2((f - mean_f).^2);
end