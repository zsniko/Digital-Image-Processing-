clear all;

f = imread(['/Users/zhifansong/Desktop/Digital Image Processing/' ...
    'Image Processing/DIPGP/CH03/Fig0304(a)(breast_digital_Xray).tif']);
figure(1); imshow(f);

% Use the default imhist function to display histogram.
subplot(2,2,1); imhist(f);
title('imhist');
% Use bar(horz,v,width).
h = imhist(f);
h1 = h(1:10:256);
horz = 1:10:256;
subplot(2,2,2); bar(horz,h1);
axis([0 255 0 10000]); % axis([horzmin hormax vertmin vertmax])
set(gca,'xtick',0:50:255); % gca get current axis
set(gca,'ytick',0:2000:10000);
title('bar')
% Use stem
subplot(2,2,3); stem(horz,h1,'fill');
axis([0 255 0 10000]);
set(gca,'xtick',0:50:255); 
set(gca,'ytick',0:2000:10000);
title('stem');
% Use plot
subplot(2,2,4); plot(h) % use the default values 
axis([0 255 0 10000]);
set(gca,'xtick',0:50:255); 
set(gca,'ytick',0:2000:10000);
title('plot');
