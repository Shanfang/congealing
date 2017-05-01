%% Gray image
rows = 5;
columns = 5;
grayImage = ones(rows, columns, 'double').*200;
xCoords= [80 180 180 80 80];
yCoords = [80 80 180 180 80];
mask = poly2mask(xCoords, yCoords, rows, columns);
grayImage(mask) = 80; 
%% First component Gray+noise
im_normal=double(grayImage./max(grayImage(:)));
im_noise= imnoise(im_normal,'gaussian',0,0.02);
%% Second component: Inhomogeneous term
X = 1:rows;                           % X is a vector from 1 to imageSize
X0 = (X / rows) -0.2;                 % rescale X 
Xm = meshgrid(X0, X0);             % 2D matrices
%% Output image
Out_Img=im_noise.*Xm;
subplot(121);imshow(grayImage);
subplot(122);imshow(Out_Img,[]);
