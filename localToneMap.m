% localToneMap.m
% Author: Eleanor White (nwhite@hmc.edu)
%
% this is going to mess with the photos to make them tone map
% and then pass back 1's as the coefficients for backwards compatibility
function [ coef1, coef2, coef3 ] = localToneMap(im1, im2, im3)

    MAX_BRIGHTNESS = 256.0;
    
    sizex, sizey = size(im1); % casually assume they're all the same size
    for x = 0:(sizex/30)
        for y = 0:(sizey/30)
            coef1 = getCoef(im1[y:y+30,x:x+30], 3.0);
            coef2 = getCoef(im2[y:y+30,x:x+30], 3.0);
            coef3 = getCoef(im3[y:y+30,x:x+30], 3.0);
            im1[y:y+30,x:x+30] = im1[y:y+30,x:x+30]*coef1
            im2[y:y+30,x:x+30] = im2[y:y+30,x:x+30]*coef2
            im3[y:y+30,x:x+30] = im3[y:y+30,x:x+30]*coef3
        end
    end
    
    coef1 = 1;
    coef2 = 2;
    coef3 = 3;
    
    % this gets the coefficient you want to multiply a photo by 
    function coef = getCoef(im, numPhotos)
        mostBright = getMostBright(im);
        fprintf('most bright');
        disp(mostBright);
        coef = getNormFactor(mostBright, numPhotos);
    end
    
    % gets the brightest value in a photo
    function mostBright = getMostBright(im)
        %imageHist = imhist(rgb2gray(im)); % histograms don't do rgb things
        %mostBright = max(imageHist);
        mostBright = max(im(:));
    end
 
    % normFactor is a factor such that if you multiply the photo by it,
    % the maximum brightness of the sum of all the photos will be 
    % Matlab's maximum value for brightness
    function normFactor = getNormFactor(mostBright, numPhotos)
        normFactor = (double(MAX_BRIGHTNESS)/double(mostBright));
        disp(normFactor);
        normFactor = double(normFactor)/double(numPhotos);
    end
    
   
    

end

