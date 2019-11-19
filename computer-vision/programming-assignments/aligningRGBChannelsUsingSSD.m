% Aligning RGB Channels (using SSD)

% The goal of this project is to learn to work with images in Matlab by taking the
% digitized glass plate images and automatically producing a color image with as few
% visual artifacts as possible. In order to do this, you will need to extract the
% three color channel images, place them on top of each other, and align them so that
% they form a single RGB color image.

% Read the image
img = imread('course1image.jpg');
B=img(1:341,1:400);
G=img(342:682,1:400);
R=img(683:1023,1:400);

% Reference Green Channel center region (51x51) -  ref_img_region (center of this
% region coincides with center of image and indexes are always integers)
ref_img_region = r51x51(G);
b_img_region = r51x51(B);
r_img_region = r51x51(R);

ref_img_region = double(ref_img_region);
r_img_region = double(r_img_region);
b_img_region = double(b_img_region);

% As R,G,B channels are highly correlated to each other, SSD metric is very likely
% to work. Your task is to hold the G channel as the reference and move around R and
% B channels over it, and keep track of the SSD value for the 51x51 image regions at
% the center of the channels. For each channel, you will find the (x,y) displacement
% vector that gives the minimum SSD value.
[x1,y1]=search(ref_img_region, r_img_region);
[x2,y2]=search(ref_img_region, b_img_region);

shiftr=circshift(R,[x1, y1]);
shiftb=circshift(B,[x2, y2]);
% Final aligned image - ColorImg_aligned
ColorImg_aligned=cat(3,shiftr,G,shiftb);

function y=r51x51(img)
    [ny,nx] = size(img);
    C = round([nx ny]/2);
    y = img(C(2)-25:C(2)+25, C(1)-25:C(1)+25);
end


% The easiest way to align the parts is to exhaustively search over a window of
% possible displacements (You will search [-10,10] pixels), score each one using
% some image matching metric, and take the displacement with the best score. The
% simplest one is the Sum of Squared Differences (SSD) distance, which simple
% subtracts one image region from the other and evaluates the sum of the squared
% values in each pixel. You need to do SSD based calculations on image regions
% which are of double Opens in new tabtype.
function [best_x, best_y]=search(A,B)
    best_SSD = realmax;
    best_x = 0;
    best_y = 0;
    for x = -10:10
        for y = -10:10
            TMP = circshift(B, [x, y]);
            SSD = sum((A - TMP).^2, 'all');
            if SSD < best_SSD
                best_SSD = SSD;
                best_x = x;
                best_y = y;
            end
        end
    end
end
