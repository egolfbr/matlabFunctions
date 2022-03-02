function out = adaptLocalNoiseFilt(original, rsz,csz, noise_var)
    sz = size(original);
    out = zeros(sz(1),sz(2));
    
    for r = 1:sz(1)
        for c = 1:sz(2)
            window = original(max(1,r-rsz):min(r+rsz,sz(1)),max(1,csz-3):min(csz+3,sz(2)));
            img_val = original(r,c);
            local_mean = double(mean(window(:)));
            local_var = var(double(window(:)));
            out(r,c) = img_val - ((noise_var^2/local_var^2)*(img_val-local_mean));    
        end
    end
    
end