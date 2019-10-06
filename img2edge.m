function edge_img = img2edge(img, type)
% ��Ե��ȡ����sobel��robert���ַ�ʽ���˴�Ĭ��img�Ƕ�ά�Ҷ�ͼ��
% �˲�������
h_roberts1 = [0, 0, 0;
              0, -1, 0;
              0, 0, 1];
h_roberts2 = [0, 0, 0;
              0, 0, -1;
              0, 1, 0];
          
h_sobel1 = [-1, -2, -1;
              0, 0, 0;
              1, 2, 1];
h_sobel2 = [-1, 0, 1;
            -2, 0, 2;
            -1, 0, 1];
if nargin == 1
    % Ĭ��Ϊsobel����
    edge_img = abs(imfilter(img, h_sobel1)) + abs(imfilter(img, h_sobel2));
else

    if strcmp(type, 'sobel')
        edge_img = abs(imfilter(img, h_sobel1)) + abs(imfilter(img, h_sobel2));
    end

    if strcmp(type, 'robert')
        edge_img = abs(imfilter(img, h_roberts1)) + abs(imfilter(img, h_roberts2));
    end
end
end