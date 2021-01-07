


im = imread ('7.png');
im2 = rgb2gray(im);
im2 = 255-im2;
im3 = zeros(108,7);
im22 = dec2hex(im2);
% for i=1:108
%     for j = 1:7
%         im3(i,j) = dec2hex(im2);
%     end
% end
im3 = reshape(im22,[112,14]);
im3

