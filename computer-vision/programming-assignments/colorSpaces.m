% Color Spaces

% Use the image given to try different color spaces and match the montage
% below. Also try to comapre difference in each channel of the color space.

RGB = imread('image1.jpg');
% Image in HSV Color Space
HSV = rgb2hsv(RGB);
% Image in YIQ Color Space
YIQ = rgb2ntsc(RGB);
% Image in YCbCr Space
YCBCR = rgb2ycbcr(RGB);
figure
montage({RGB, HSV, YIQ, YCBCR}, 'BorderSize', 10);

% HSV channel montage
[h s v] = imsplit(HSV);
figure
montage({h, s, v, HSV}, 'BorderSize', 10);
