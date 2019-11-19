% Image Gradient Magnitude
% The image gradient magnitude corresponds to the strength of edges in any given
% image.  In this problem, you will evaluate the Sobel Image Gradients Gx and Gy
% for the 'cameraman.tif' image and subsequently Gradient magnitude Gmag and
% Gradient direction Gdir

% Reference: https://www.mathworks.com/help/images/ref/imgradient.html

% Read the 'cameraman.tif' image into variable img

% Compute Gx and Gy using imgradientxy function

% Compute Gmag and  Gdir using imgradient function

img=imread('cameraman.tif');

[Gx,Gy]=imgradientxy(img,'sobel');
imshowpair(Gx,Gy,'montage')

[Gmag,Gdir] = imgradient(Gx,Gy);
imshowpair(Gmag,Gdir,'montage')
