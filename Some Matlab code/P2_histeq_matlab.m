clear all;

f = imread(['/Users/zhifansong/Desktop/Digital Image Processing/' ...
    'Image Processing/DIPGP/CH03/Fig0316(4)(bottom_left).tif']);
%figure(1); imshow(f);

subplot(2,2,1),imshow(f);
subplot(2,2,2),imhist(f);
g = histeq(f,256);
subplot(2,2,3),imshow(g);
subplot(2,2,4),ylim('auto'),imhist(g);


