clear all;

f = imread(['/Users/zhifansong/Desktop/Digital Image Processing/' ...
    'Image Processing/DIPGP/CH03/Fig0323(a)(mars_moon_phobos).tif']);
figure(1);
subplot(2,2,1); imshow(f);
subplot(2,2,2); imhist(f,256); 
subplot(2,2,3); g = histeq(f); imshow(g);
subplot(2,2,4); imhist(g,256);

figure(2);
g2 = intrans(f,'stretch',mean2(im2double(f)),0.8)
imshow(g2)

figure(3);
p = manualhist 
g3 = histeq(f,p);
subplot(1,2,1); imshow(g3)
subplot(1,2,2); imhist(g3)

function p = twomodegauss(m1, sig1, m2, sig2, A1, A2, k)
%TWOMODEGAUSS Generates a bimodal Gaussian function.
%   P = TWOMODEGAUSS(M1,SIG1,M2,SIG2,A2,A2,K) generates a bimodal,
%   Gaussian-like function in the interval [0,1]. P is a 256-element
%   vector normalized so that SUM(P) equals 1. The mean and standard
%   deviation of the modes are (M1,SIG1) and (M2,SIG2), respectively.
%   A1 and A2 are the amplitude values of the two modes. Since the
%   output is normalized, only the relative values of A1 and A2 are 
%   important. K is an offset value that raises the "floor" of the 
%   function. A good set of values to try is M1 = 0.15, SIG = 0.05, 
%   M2 = 0.75, SIG2 = 0.05, A1 = 1, A2 = 0.07, and K = 0.002.

c1 = A1 * (1/((2*pi)^0.5)*sig1);
k1 = 2*(sig1^2);
c2 = A2 * (1/((2*pi)^0.5)*sig2);
k2 = 2*(sig2^2);
z = linspace(0,1,256);

p = k+c1*exp(-((z-m1).^2)./k1)+c2*exp(-((z-m2).^2)./k2);
p = p./sum(p(:));
end

function p = manualhist
%manulhist generates a bimodal histogram interactively
%   p = manulhist generates a bimodal histogram using TWOMODEGAUSS. 
%   m1 and m2 are the means of the two modes and must be in the range
%   [0,1]. sig1 and sig2 are the standard deviations of the two modes.
%   A1 and A2 are amplitude values, and k is an offset value that raises
%   the "floor" of histogram. The number of elements in the histogram
%   vector P is 256 and sum(P) is normalized to 1. manualhist repeatedly
%   prompts for the parameters and plots the resulting histogram until the
%   user types an 'x' to quit, and then it returns the last histogram
%   computed.
%
%   A good set of starting value is : (0.15,0.05,0.75,0.05,1,0.07,0.002).

% Initialize.
repeats = true;
quitnow = 'x';

% Compute a default histogram in case the user quits before estimating at
% least one histogram.
p = twomodegauss(0.15,0.05,0.75,0.05,1,0.07,0.002);
% Cycle until an x is input
while repeats
    s = input('Enter m1,sig1,m2,sig2,A1,A2,k OR x to quit:','s');
    if s == quitnow
        break;
    end

    % Convert the input string to a vector of numerical values and verify
    % the number of inputs.
    v = strnum(s);
    if numel(v) ~= 7
        disp('Incorrect number of inputs.')
        continue
    end
    p = twomodegauss(v(1),v(2),v(3),v(4),v(5),v(6),v(7));
    % Start a new figure and scale the axes. Specifying only xlim leaves
    % ylim on auto.
    figure, plot(p)
    xlim([0 255]);
end
end
