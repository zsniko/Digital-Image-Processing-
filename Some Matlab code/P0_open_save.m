f = imread(['/Users/zhifansong/Desktop/Digital Image Processing/' ...
    'Image Processing/DIPGP/CH01/Fig0114(d)(bubbles).tif']);
% imshow(f,[low high])will make all pixels <= low black and those >= high
% white, imshow(f,[]) make all pixels values <= min(f) black and >=max(f) w
imshow(f),figure,imshow(f,[0,250]);

imwrite(f,'/Users/zhifansong/Desktop/bubbles','tif');
imwrite(f,'/Users/zhifansong/Desktop/bubbles25.tif','Compression','none', ...
    'resolution',[357 341]);

% K is a struct
K = imfinfo('/Users/zhifansong/Desktop/bubbles25.tif');

for q = [5,15,25,50]
    filename = sprintf('/Users/zhifansong/Desktop/bubbles_%d.jpg',q);
    imwrite(f,filename,'quality',q)
end

