% Resizing Image
% Resize the given image into half by selecting alternate rows and columns

img = imread('zone.gif');

%Modify the code below. Select alternate rows and columns from img using MATLAB matrix slicing
[r,c] = size(img)

img_resized = zeros(r/2, c/2);

j=1;
for i=1:2:r
    img_resized(j,:) = img(i,1:2:end);
    j = j + 1;
end
r = r/2
c = c/2
img_resized = uint8(img_resized)

figure;
imshow(img)
%truesize
figure;
imshow(img_resized)
%truesize
