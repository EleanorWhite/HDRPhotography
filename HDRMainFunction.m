% Get names of images from user
% These files must be in the directory from which you are running this program.
filename1 = input('please enter first filename:\n', 's');  
filename2 = input('please enter second filename:\n', 's');
filename3 = input('please enter third filename:\n', 's');

image1 = imread(filename1);
image2 = imread(filename2);
image3 = imread(filename3);

% Makes an HDR image equally combining the three images
if 1 == 1
    [coef1,coef2,coef3] = globalToneMapEqualWeight(image1, image2, image3);
    hdrImage = coef1*image1 + coef2*image2 + coef3*image3;
    imshow(hdrImage);
    hdrImage = coef1*image1 + coef2*image2 + coef3*image3;
    imshow(hdrImage);
end
   
% Makes an HDR image biased towards brighter images
if 1 == 1
    figure
    [coef1,coef2,coef3] = globalToneMapBiasedBright(image1, image2, image3);
    hdrImage = coef1*image1 + coef2*image2 + coef3*image3;
    imshow(hdrImage);
    hdrImage = coef1*image1 + coef2*image2 + coef3*image3;
    imshow(hdrImage);
end
    
% Makes an HDR image biased towards darker images
if 1== 1
    figure
    [coef1,coef2,coef3] = globalToneMapBiasedDark(image1, image2, image3);
    hdrImage = coef1*image1 + coef2*image2 + coef3*image3;
    imshow(hdrImage);
    hdrImage = coef1*image1 + coef2*image2 + coef3*image3;
    imshow(hdrImage);
end

