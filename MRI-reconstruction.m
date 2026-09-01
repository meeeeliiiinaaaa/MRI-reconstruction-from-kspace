
%% Q2
clc;
Y = ifftshift(ifft2(dat));
imagesc(abs(Y));
colormap(gray);

%% Q3
subplot(2,2,1)
im1_nl = imread("image1.png","png");
imhist(im1_nl);

subplot(2,2,2)
im1_n =  imread("image11.png","png");
imhist(im1_n);

subplot(2,2,3)
im2_nl =  imread("image21.png","png");
imhist(im2_nl);

subplot(2,2,4)
im2_n =  imread("image2.png","png");
imhist(im2_n);

%% Q43
output1= meanFilter(converter('lenna.jpg'));
imshow(output1);

%% Q44
output2 = medianFilter(3, 3, converter('lenna.jpg'));
imshow(output2);

 %% Q45
output3 = gaussianFilter(converter('lenna.jpg'));
imshow(output3);

%% Q46
output4 = nlmFilter(converter("image2.png"));
imshow(output4);

%% Q47
clc;

ref = imread("kneeMRI.jpg");
ref = im2double(ref);
firstNoisyImage = abs(Y);

noisyImage1 = meanFilter(firstNoisyImage);
[peaksnr1, snr1] = psnr(noisyImage1, ref);

noisyImage2 = medianFilter(3, 3, firstNoisyImage);
[peaksnr2, snr2] = psnr(noisyImage2, ref);

noisyImage3 = gaussianFilter(firstNoisyImage);
[peaksnr3, snr3] = psnr(noisyImage3, ref);

noisyImage4 = nlmFilter(firstNoisyImage);
[peaksnr4, snr4] = psnr(noisyImage4, ref);

[peaksnr5, snr5] = psnr(firstNoisyImage, ref);


%% Functions

function matrixIm = converter(image)
 Im = imread(image);
 Im = im2gray(Im);
 matrixIm = im2double(Im);
end

function output = meanFilter(image)
 h = ones(3, 3) / 9;
 output = convn(image,h, 'same');
end

function output = medianFilter(m, n, image)
 output = medfilt2(image, [m n]);
end

function output = gaussianFilter(image)
 h = (1/16)*[1 2 1;2 4 2; 1 2 1];
 output = convn(image, h, 'same');
end

function output = nlmFilter(image)
 output =  imnlmfilt(image);
end

