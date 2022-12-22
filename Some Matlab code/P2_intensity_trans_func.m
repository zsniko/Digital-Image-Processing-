clear all; clf;

% rgb = imread(['/Users/zhifansong/Desktop/sb.jpeg']);
% f = rgb2gray(rgb);
% imshow(f)

%imwrite(f,'/Users/zhifansong/Desktop/sb_compressed.jpg','quality',10)
fc = imread(['/Users/zhifansong/Desktop/Digital Image Processing/' ...
    'Image Processing/IPImages/testpic_compressed.jpg']);
figure(1);
imshow(fc);

g = imadjust(fc,[0.5 0.8],[0 1],1);
figure(2);
imshow(g);

g1 = transform(fc,0.5,0.8,0,1);
figure(3);
imshow(g1);

% to show that g = g2:
tfg = isequal(g,g1)

h = imadjust(fc,[0.5 0.8],[1 0],1);
figure(4);
imshow(h);
h1 = transform(fc,0.5,0.8,1,0);
figure(5)
imshow(h1)
tfh = isequal(h,h1)


function  g = transform(f,low_in,high_in,low_out,high_out)
dim = size(f); % get the dimension of the input image
g = zeros(dim(1),dim(2)); % initialize the output image
f = double(f)/255; % transform the scale of image from 0-255 to 0-1
%f = mat2gray(f); does the same job.
a = (high_out - low_out)/(high_in-low_in); % slope of transformation
b = high_out - high_in*a; % intercept
% go through the image matrix 
for i = 1:dim(1)
    for j=1:dim(2)     
        if f(i,j) <= low_in 
            g(i,j) = low_out; 
        elseif f(i,j) >=high_in
            g(i,j) = high_out;
        else 
            g(i,j) = a * f(i,j) + b;
        end
    end
end
g = uint8(g*255); % convert to uint8 after scaling from 0-1 to 0-255 
%g = im2uint8(g); does the same job
end

