function out = my_thinning(img,space,iterations)
[M,N] = size(img);
img_ = img;
for n = 1:iterations
    for i = 2:M-1
        for j = 2:N-1
                temp = img(i-1:i+1,j-1:j+1);
                if sum(temp(:))<space
                    img_(i,j)=0;
                end

        end
    end
end
out = img_;