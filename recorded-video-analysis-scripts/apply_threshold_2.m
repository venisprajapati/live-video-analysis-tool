% Takes total no. of images as input
total_prompt = "Enter total number of Frames: ";
total_frames = str2double(input(total_prompt, "s"));
if isempty(total_frames)
    return;
end

% Accepts color and thresh value in input
color_prompt = "Enter color to apply threshold on [R, G, B]: ";
color_name = input(color_prompt, "s");

thresold_prompt = "Enter thresold value to apply on image [0-255]: ";
thresold_value = str2double(input(thresold_prompt, "s"));
if isempty(thresold_value)
    return;
end

% Plots graph of applied threshold value and saves the threshold images to
% a threshold_images folder
ar = zeros(1,total_frames);

for n=1:1:total_frames

    img=imread(sprintf('roi_images\\%d.jpg', n));
    [height, width, dim] = size(img);

    if color_name == 'R'
        for i=1:height
            for j=1:width
                if (img(i,j,1) > thresold_value)
                    img(i,j,1)=192;
                    img(i,j,2)=64;
                    img(i,j,3)=192;
                end
            end
        end
    
    elseif color_name == 'G'
        for i=1:height
            for j=1:width
                if (img(i,j,2) > thresold_value)
                    img(i,j,1)=192;
                    img(i,j,2)=64;
                    img(i,j,3)=192;
                end
            end
        end 
    
    else
        for i=1:height
            for j=1:width
                if (img(i,j,3) > thresold_value)
                    img(i,j,1)=192;
                    img(i,j,2)=64;
                    img(i,j,3)=192;
                end
            end
        end
    
    end

    sum_px = 0;
    for i=1:height
        for j=1:width
            if img(i,j,1) == 192 && img(i,j,2) == 64 && img(i,j,3) == 192
                sum_px = sum_px + 1;
            end
        end
    end

    ar(1,n) = sum_px;

    imwrite(img,['threshold_images\', int2str(n), '.jpg']);

end

plot(ar);