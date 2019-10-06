function output_convar = convar_img(f,g)
% ��f��g��Э���� ��f��g��ͬʱ���Ϊ���Ҫ��f��g�Ĵ�Сһ��
f = double(f);
g = double(g);
% �����ж���������ͼ��Ĵ�С�Ƿ������ϵ
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