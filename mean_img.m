function output_mean = mean_img(f)
dim_img = ndims(f);

% �Ҷ�ͼֱ�Ӵ���
if dim_img == 2
    output_mean = mean2(f); 
end
% ���ڲ�ɫͼ ת�ɻҶ�ͼ����
if dim_img == 3
    gray_f = rgb2gray(uint8(f));
    output_mean = mean2(gray_f);

end

end

