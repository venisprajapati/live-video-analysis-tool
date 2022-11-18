% Before running any file create 2 folders in current directory:
% 1. roi_images
% 2. threshold_images

% Enter Video name
video_prompt = "Enter name of video: ";
vid_name = input(video_prompt,"s"); 
if isempty(vid_name)
    return;
end

vid = VideoReader(vid_name);
total_frames = ceil(vid.FrameRate*vid.Duration);

disp("Current Frame Rate of the video: " + vid.FrameRate);
disp("Duration of the video: " + vid.Duration);
disp("Total no. of Frames in the video: " + total_frames);

frame_prompt = "Enter the difference between 2 consecutive frames to capture: ";
frame_input = input(frame_prompt,"s");
fpsread=str2double(frame_input);

% Display 1st frame of video
im = read(vid, 1);
imshow(im);
pause(0.1);

% Pixel prompt
x1_prompt = "X1= ";
y1_prompt = "Y1= ";
x2_prompt = "X2= ";
y2_prompt = "Y2= ";

x1 = str2double(input(x1_prompt,"s"));
y1 = str2double(input(y1_prompt,"s"));
x2 = str2double(input(x2_prompt,"s"));
y2 = str2double(input(y2_prompt,"s"));

% Crop frames of the video at x fps
x = x2-x1;
y = y2-y1;
c = 1;
for frame_num = 1:fpsread:total_frames

    I = read(vid,frame_num);
    img = imcrop(I,[x1 y1 x y]);
    time=int2str(c);
    imwrite(img,['roi_images\', time, '.jpg']);
    c = c + 1;

end

close all;