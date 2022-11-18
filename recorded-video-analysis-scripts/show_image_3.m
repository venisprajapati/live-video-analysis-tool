% Accepts number of image as input
image_number_prompt = "Enter number of Image you want to inspect: ";
image_number = str2double(input(image_number_prompt, "s"));
if isempty(image_number)
    return;
end

% Read image
img=imread(sprintf('roi_images\\%d.jpg', image_number));

% Plots the histogram with RGB values with image and displays original image
redChannel = img(:,:,1); % Red channel
greenChannel = img(:,:,2); % Green channel
blueChannel = img(:,:,3); % Blue channel

subplot(3,4,[1,2,5,6]),imshow(img),title('Original Image');
subplot(3,4,[9,10]),imhist(img),title('Original Image Histogram');
subplot(3,4,3),imshow(redChannel),title('Red Channel');
subplot(3,4,7),imshow(greenChannel),title('Green Channel');
subplot(3,4,11),imshow(blueChannel),title('Blue Channel');
subplot(3,4,4),imhist(redChannel),title('Red Histogram');
subplot(3,4,8),imhist(greenChannel),title('Green Histogram');
subplot(3,4,12),imhist(blueChannel),title('Blue Histogram');