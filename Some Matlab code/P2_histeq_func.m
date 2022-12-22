clear all;

% Entry
f0 = imread(['/Users/zhifansong/Desktop/Digital Image Processing/' ...
    'Image Processing/DIPGP/CH03/Fig0316(4)(bottom_left).tif']);
f = f0;
g = f0;

% If the image is a color image, change it to a gray image.
[height, width, nbOfColorChannels] = size(f0);
if nbOfColorChannels > 1
    disp(nbOfColorChannels);
    f = rgb2gray(f0);
end

% Show the original image
subplot(2,4,1); imshow(f);
title('Original Image');

% NumPixel is the number of occurences of each gray level
NumPixel = compute_histogram(f,'Histogram of Original Image',2);
% ProbPixel is the probability of an occurence of each gray level;
ProbPixel = compute_normalized_histogram(NumPixel,f, ...
    'Normalized Histogram of Original Image',3);
% CumuPixel is the cumulative distribution function
CumuPixel = compute_cumulative_histogram(ProbPixel, ...
    'Cumulative Histogram of Original Image',4);

CumuPixel = im2uint8(CumuPixel); % 255*CumuPixel

for i = 1:height
    for j = 1:width
        f(i,j) = CumuPixel(f(i,j)+1);
    end
end


% show the new image
subplot(2,4,5)
imshow(f)
title('New Image')

% show the new image's histograms
NewNumPixel = compute_histogram(f,'Histogram of New Image',6);
NewProbPixel = compute_normalized_histogram(NewNumPixel,f,'Normalized Histogram of New Image',7);
NewCumuPixel = compute_cumulative_histogram(NewProbPixel,'Cumulative Histogram of New Image',8);





%%%
function f = compute_histogram(f,title0,position)
%compute_histogram
%   f: the image
%   title0: histogram's title
%   position: histogram's position

[height, width] = size(f);

% Compute the number of occurences of each gray level
NumPixel = zeros(1,256); % init vec
for i = 1:height
    for j = 1:width
        NumPixel( f(i,j)+1 ) = NumPixel( f(i,j)+1 ) + 1; % increment
    end
end

subplot(2,4,position)
bar(NumPixel)
title(title0);

f = NumPixel;
end

%%%
function f = compute_normalized_histogram(NumPixel,f,title0,position)
%compute_normalized_histogram
%   NumPixel: number of each gray level
%   f: the image
%   title0: histogram's title
%   position: histogram's position
[height, width] = size(f);

% Compute the probability of an occurence of each gray level
ProbPixel = zeros(1,256);
for i = 1:256
    ProbPixel(i) = NumPixel(i)/(height*width*1.0);
end

subplot(2,4,position);
bar(ProbPixel);
title(title0);

f = ProbPixel;
end

%%%
function f = compute_cumulative_histogram(ProbPixel,title0,position)
%compute_cumulative_histogram
%   ProbPixel: probability density of each gray level
%   title0: histogram's title
%   position: histogram's position

% Compute the cumulative distribution function
CumuPixel = zeros(1,256);
for i = 1:256
    if i == 1
        CumuPixel(i) = ProbPixel(i)
    else
        CumuPixel(i) = CumuPixel(i-1) + ProbPixel(i)
    end
end

subplot(2,4,position);
bar(CumuPixel);
title(title0);

f = CumuPixel;
end



