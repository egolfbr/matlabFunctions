function out = adaptMedFilt(original, K1,K2, maxSz)
    sz = size(original);
    out = zeros(sz(1),sz(2));
    wsz = maxSz;
    for r = 1:sz(1)
        for c = 1:sz(2)
            rsz = 1;
            csz = 1;
            while(1)
                window = original(max(1,r-rsz):min(r+rsz,sz(1)),max(1,c-csz):min(c+csz,sz(2)));
                min_val = int8(min(window(:)));
                max_val = int8(max(window(:)));
                med_val = int8(median(window(:)));
                img_val = int8(original(r,c));
                A1 = med_val - min_val;
                A2 = med_val - max_val;
                if (A1 > K1) && (A2<K2)
                    % STAGE B
                    B1 = img_val - min_val;
                    B2 = img_val - max_val;
                    if (B1>K1) && (B2<K2)
                        out(r,c) = img_val;
                        break;
                    else
                        out(r,c) = med_val;
                        break;
                    end
                else
                    % increase window size and repeat while loop
                    rsz = rsz + 1;
                    csz = csz + 1;
                    if (rsz > wsz)
                        % if we are greater than the max window size
                        % output the median value
                        out(r,c) = med_val;
                        break;
                    end
                end
            end
        end
    end
end