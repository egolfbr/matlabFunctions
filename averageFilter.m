function out = averageFilter(original, rsz,csz)
    sz = size(original);
    out = zeros(sz(1),sz(2));
    for r = 1:sz(1)
        for c = 1:sz(2)
            window = original(max(1,r-rsz):min(r+rsz,sz(1)),max(1,c-csz):min(c+csz,sz(2)));
            out(r,c) = double(mean(window(:)));
        end
    end
end