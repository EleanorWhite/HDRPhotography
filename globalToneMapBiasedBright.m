% 
% Gets coefficients to multiply the images by to get a properly
% exposed image
%
% These coefficients are biased towards the brightest image:
% so the images will have weight proportional to how bright their brightest
% pixel is.
function [coef1,coef2,coef3] = globalToneMapBiasedBright(im1, im2, im3)
    
    % Gets the maximum brightness value for the three images
    im1Hist = imhist(rgb2gray(im1)); % histograms don't do rgb things
    max1 = max(im1Hist);
    im2Hist = imhist(rgb2gray(im2));
    max2 = max(im2Hist);
    im3Hist = imhist(rgb2gray(im3));
    max3 = max(im3Hist);
    
    % find the sum of all the maxes
    totBright = max1+max2+max3;
    
    % find the factor needed to make the sum 256
    % because 256 is the max brightness for an image
    normFactor = 256/totBright;
    
    % setting all coefficients to norm factor will make the total
    % photo have the correct maximum brightness
    coef1 = normFactor %*(max1/totBright);
    coef2 = normFactor %*(max2/totBright);
    coef3 = normFactor %*(max3/totBright);
    
end

