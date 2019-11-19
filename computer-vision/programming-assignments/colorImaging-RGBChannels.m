% Color Imaging - RGB Channels

% Sergei Mikhailovich Prokudin-Gorskii (1863-1944) was a photographer who,
% between the years 1909-1915, traveled the Russian empire and took thousands
% of photos of everything he saw. He used an early color technology that
% involved recording three exposures of every scene onto a glass plate using
% a red, green, and blue filter. Back then, there was no way to print such
% photos, and they had to be displayed using a special projector.

% The goal of this assignment is to learn to work with images in Matlab by
% taking the digitized Prokudin-Gorskii glass plate images and automatically
% producing a color image.  In order to do this, you will need to extract the
% three color channel images, place them on top of each other, so that they
% form a single RGB color image. Your program should take a glass plate
% imageOpens in new tabOpens in new tab as input and produce a single color
% image as output.

% The top most image belongs to Blue channel. The middle image belongs to
% Green channel and the bottom image belongs to Red channel.

% The program should divide the image into three equal parts and place
% the second and the third parts (G and R) on to the first (B)

% You have to name your variables as below
% Blue channel Image - B
% Green channel Image - G
% Red channel Image - R
% Concatenated Color Image - ColorImg

%Read the image
img = imread('image.jpg');

%Get the size (rows and columns) of the image
[r,c] = size(img);
rr=r/3;
%Write code to split the image into three equal parts and store them in B, G, R channels

B=imcrop(img,[1,1,c,rr-1]);
G=imcrop(img,[1,1*rr+1,c,rr-1]);
R=imcrop(img,[1,2*rr+1,c,rr-1]);

%concatenate R,G,B channels and assign the RGB image to ColorImg variable
ColorImg(:,:,1) = R;
ColorImg(:,:,2) = G;
ColorImg(:,:,3) = B;
imshow(ColorImg)
