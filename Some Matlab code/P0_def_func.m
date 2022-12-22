clear all; clf;

f = [1 2;3 4]
g = [1 2;2 1]

[p,pmax,pmin,pn] = improd(f,g)

A = [1 2;3 4]
av_A = average_intensity(A)

f = imread(['/Users/zhifansong/Desktop/Digital Image Processing/' ...
    'Image Processing/DIPGP/CH03/Fig0304(a)(breast_digital_Xray).tif']);
s = subim(f,200,200,160,80)
imshow(s,[])

[rt,f,g] = twodsin(1,1/(4*pi),1/(4*pi),512,512);
g = mat2gray(g);
imshow(g)


function [p,pmax,pmin,pn] = improd(f,g)
%IMPROD computes the product of two images.
%   [p,pmax,pmin,pn] = improd(f,g) outputs the element by element
%   product of two input images, f and g, the product maximum and 
%   minimum values, and a normalized product array with values 
%   in the range [0,1]. The input images must be of the same size. 
%   They can be of class uint8, uint16 or double. The outputs are of class
%   double
fd = double(f);
gd = double(g);
p = fd.*gd;
pmax = max(p(:));
pmin = min(p(:));
pn = mat2gray(p);
end

function av = average_intensity(A)
% AVERAGE computes the average value of an array
% AV = average(A) computes teh average value of input array,A, which must
% be a 1-D or 2-D array.
% Check the validity of the input.(1-D array is a special case of 2-D)
if ndims(A) > 2
    error('dimension fo input cannot exceed 2.')
end
% Compute the average
av = sum(A(:))/numel(A);
end

function s = subim(f,m,n,rx,cy)
% SUBIM extracts a subimage, s, from a given image, f.
% The subimage is of size mxn, and the coordinates 
% of its top,left corner are (rx,cy)
s = zeros(m,n)
rowhigh = rx + m - 1;
colhigh = cy + n - 1;
xcount = 0;

for r = rx:rowhigh
    xcount = xcount + 1;
    ycount = 0;
    for c = cy:colhigh
        ycount = ycount + 1;
        s(xcount,ycount) = f(r,c);
    end
end

end

function [rt,f,g] = twodsin(A,u0,v0,M,N)
%TWODSIN Compares for loops vs. vectorization
% comparison based on implementin the fct f(x,y) = Asin(u0x+v0y) for 
% x = 0,1,2,...,M-1 and y = 0,1,2,...,N-1. The inputs to the fct are 
% M,N,and the csts in the fct
%
tic % start timing
for r = 1:M
    u0x = u0*(r-1);
    for c = 1:N
        v0y = v0*(c-1);
        f(r,c) = A*sin(u0x+v0y);
    end
end
t1 = toc; % end timing

tic 
r = 0:M-1
c = 0:N-1
[C,R] = meshgrid(c,r);
g = A*sin(u0*R+v0*C);
t2 = toc;

rt = t1/(t2+eps);
end