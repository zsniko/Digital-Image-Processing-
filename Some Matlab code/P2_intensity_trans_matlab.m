clear all; close all; clf;

f = imread(['/Users/zhifansong/Desktop/Digital Image Processing/' ...
    'Image Processing/DIPGP/CH03/Fig0304(a)(breast_digital_Xray).tif']);
f1 = imadjust(f,[0 1],[1 0]); % imcomplement(f) does the same thing
f2 = imadjust(f,[0.5 0.75],[0 1]);
f3 = imadjust(f,[],[],2);

subplot(1,4,1)
imshow(f);
title('original image')
subplot(1,4,2)
imshow(f1);
title('complement')
subplot(1,4,3)
imshow(f2);
title('[0.5 0.75] to [0 1]')
subplot(1,4,4)
imshow(f3);
title('gamma = 2')
sgtitle('Brest Xray Image Processing')


g = imread(['/Users/zhifansong/Desktop/Digital Image Processing/' ...
    'Image Processing/DIPGP/CH03/Fig0305(a)(DFT_no_log).tif']);
g = im2uint8(mat2gray(log(1+double(g))));
figure;
imshow(g)