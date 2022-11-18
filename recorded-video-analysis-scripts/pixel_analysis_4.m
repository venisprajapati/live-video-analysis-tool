% Accepts various inputs
total_prompt = "Enter total number of Frames: ";
total_frames = str2double(input(total_prompt, "s"));
if isempty(total_frames)
    return;
end

disp("Enter X and Y axis values of pixel to do further analysis ");
x_prompt = "X: ";
y_prompt = "Y: ";

x = str2double(input(x_prompt,"s"));
y = str2double(input(y_prompt,"s"));

line_img = zeros(1,total_frames,3,'uint8');

for n = 1:1:total_frames

    img=imread(sprintf('roi_images\\%d.jpg', n));
    line_img(:,n,1)=img(y,x,1);
    line_img(:,n,2)=img(y,x,2);
    line_img(:,n,3)=img(y,x,3);

end

% Plots the graph of Intensity of RGB  values
% Measurement 1 unit = 100 ms => 10 unit = 1 second (ideal if you have entered 
% "distance between 2 consecutive ")

subplot(3,1,1),plot(line_img(:,:,1)),title('Intensity of Red Light');
subplot(3,1,2),plot(line_img(:,:,2)),title('Intenstiy of Green Light');
subplot(3,1,3),plot(line_img(:,:,3)),title('Intensity of Blue Light');