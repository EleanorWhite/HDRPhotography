function [ coef1, coef2, coef3 ] = globalToneMapEqualWeight(im1, im2, im3)
% this is going to give back coefficients that give every photo 
% the same dynamic range
% so for each photo, the brightest point will be 1/3 of maximal brightness

    MAX_BRIGHTNESS = 256.0;
    
    % gets the coefficients for the 3 images
    coef1 = getCoef(im1, 3.0);
    coef2 = getCoef(im2, 3.0);
    coef3 = getCoef(im3, 3.0);
    
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

