function [ out ] = PSNR( f, g )
rmse_value = rmse(f, g);
B = 8; % ͼ�����
MAX = 2^B -1; % ͼ��Ҷȼ�
out = 20*log10(MAX/rmse_value);               
end

