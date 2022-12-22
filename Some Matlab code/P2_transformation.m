clear all;

f = imread(['/Users/zhifansong/Desktop/Digital Image Processing/' ...
    'Image Processing/DIPGP/CH01/Fig0106(a)(bone-scan-GE).tif']);
figure(2); imshow(f);
g = intrans(f,'stretch',mean2(im2double(f))+0.1,0.9);
figure(3);imshow(g);

