clear all; clf;

f = imread(['/Users/zhifansong/Desktop/Digital Image Processing/' ...
    'Image Processing/DIPGP/CH01/Fig0107(a)(chest-xray-vandy).tif']);
fd1 = f(end:-1:1,:);
fd2 = f(:,end:-1:1);
fd3 = f(end:-1:1,end:-1:1);

fc = f(50:493,70:530);

subplot(2,3,1)
imshow(f,[ ])
title('original image')
subplot(2,3,2)
imshow(fd1)
title('vertical flip')
subplot(2,3,3)
imshow(fd2)
title('horizontal flip')
subplot(2,3,5)
imshow(fd3)
title('flip flip')
subplot(2,3,4)
imshow(fc)
title('cropped image')
subplot(2,3,6)
plot(f(round(size(f,1)/2),:)) % f.shape[0]/2
title('central horizontal scanning line')
