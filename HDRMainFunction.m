filename1 = ('IMG_3053.JPG') %input(prompt, 'please enter filename');
filename2 = ('IMG_3054.JPG') %input(prompt, 'please enter filename');
filename3 = ('IMG_3055.JPG') %input(prompt, 'please enter filename');


image1 = imread(filename1);
image2 = imread(filename2);
image3 = imread(filename3);
% imshow(image1);

% biasing towards brighter images
if 1 == 1
    [coef1,coef2,coef3] = globalToneMapEqualWeight(image1, image2, image3);
    hdrImage = coef1*image1 + coef2*image2 + coef3*image3;
    imshow(hdrImage);
    hdrImage = coef1*image1 + coef2*image2 + coef3*image3;
    imshow(hdrImage);
end
    
if 1 == 1
    figure
    [coef1,coef2,coef3] = globalToneMapBiasedBright(image1, image2, image3);
    hdrImage = coef1*image1 + coef2*image2 + coef3*image3;
    imshow(hdrImage);
    hdrImage = coef1*image1 + coef2*image2 + coef3*image3;
    imshow(hdrImage);
end
    
if 1== 1

    figure
    [coef1,coef2,coef3] = globalToneMapBiasedDark(image1, image2, image3);
    hdrImage = coef1*image1 + coef2*image2 + coef3*image3;
    imshow(hdrImage);
    hdrImage = coef1*image1 + coef2*image2 + coef3*image3;
    imshow(hdrImage);
end

