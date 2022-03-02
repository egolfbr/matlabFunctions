function flag = matComp(A,B)
assert(size(A) == size(B));
rc = size(A);
flag = 0;
for i = 1:rc(1)
    for j = 1:rc(2)
        if A(i,j) ~= B(i,J)
            flag = 1;
            disp('Not Equal')
            break
        end
    end
end    
end