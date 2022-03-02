function slice_img=colorSliceImg(colorVec,img,rad,bckgnd)
% colorVec is the vector of the color you want to slice
% img is the image you want to slice 
% radius is the radius of the color spectrum that you consider valid
    % typically 100. Can be different if the elements of img are normalized
% bckgnd is the multiplier applied to pixels that are outside the radius
   % typically set to 0
rad_sq = rad^2;
sz = size(img);
slice_img = zeros(sz(1),sz(2),sz(3));

for i =1:sz(1)
    for j = 1:sz(2)
        %set variable equal to zero before recalculation
        term = 0;
        for k = 1:3
             
            term = term + (img(i,j,k)-colorVec(k))^2;
            

        end
        
        if term > rad_sq
            for kk =1:3
                slice_img(i,j,kk) = bckgnd*img(i,j,kk);
            end
        else
            for kk =1:3
                slice_img(i,j,kk) = img(i,j,kk);
            end
        end
        
    end
end

slice_img = uint8(slice_img);
end