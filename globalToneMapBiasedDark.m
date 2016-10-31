function [ coef1, coef2, coef3 ] = globalToneMapBiasedDark(im1, im2, im3)
% this is going to give back coefficients that give every photo 
% a dynamic range inversely proportional to the magnitude of their
% maximum brightness

    MAX_BRIGHTNESS = 256.0;
    
    % gets the coefficients for the 3 images
    [rmf1, rmf2, rmf3] = getRelMaxFactors(im1, im2, im3);
    disp(rmf1);
    disp(rmf2);
    disp(rmf3);
    coef1 = getCoef(im1, rmf1);
    coef2 = getCoef(im2, rmf2);
    coef3 = getCoef(im3, rmf3);
    
    % this gets the coefficient you want to multiply a photo by 
    function coef = getCoef(im, relMaxFactor)
        mostBright = getMostBright(im);
        coef = getNormFactor(mostBright, relMaxFactor);
    end
    
    % gets the brightest value in a photo
    function mostBright = getMostBright(im)
        %imageHist = imhist(rgb2gray(im)); % histograms don't do rgb things
        %mostBright = max(imageHist);
        mostBright = max(im(:));
    end

    % this gets a value for each photo that is
    % inversely proportional to their brightest pixel
    function [rmf1, rmf2, rmf3] = getRelMaxFactors(im1, im2, im3)
        mostBright1 = getMostBright(im1);
        mostBright2 = getMostBright(im2);
        mostBright3 = getMostBright(im3);
        totBright = mostBright1 + mostBright2 + mostBright3;
        rmf1 = double(mostBright2+mostBright3)/(2*(double(totBright)));
        rmf2 = double(mostBright1+mostBright3)/(2*(double(totBright)));
        rmf3 = double(mostBright1+mostBright2)/(2*(double(totBright)));
    end
 
    % normFactor is a factor such that if you multiply the photo by it,
    % the maximum brightness of the sum of all the photos will be 
    % Matlab's maximum value for brightness
    function normFactor = getNormFactor(mostBright, relMaxFactor)
        newMostBright = (double(MAX_BRIGHTNESS)*double(relMaxFactor));
        normFactor = double(newMostBright)/double(mostBright);
        fprintf('normFactor:');
        disp(normFactor);
    end
    
   
    

end