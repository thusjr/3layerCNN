


im = imread ('8.png');
im2 = rgb2gray(im);
im2 = 255-im2;
im3 = zeros(108,7);
for i= 1:28
    im22((i-1)*28+1:i*28,:) = dec2hex(im2(i,:),2);
end
for i=1:112
    for j = 1:7
        im33(i,2*j-1:2*j) = im22((i-1)*7+j,:);
    end
end
% im33 = reshape(im22,[112,14]);
% im3 = reshape(im2,[112,7]);

