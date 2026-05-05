function ns = nonmaximasuppression(img)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% identify as edge the pixel in the gradient      %
% image that is greater than two adjacents pixels %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% img:      gradient image                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img = padarray(img,[1,1]);
[M,N] = size(img);
img_ns = zeros(size(img));
% h_size = floor(size);
for i = 2:M-1
    for j = 2:N-1
        if img(i,j)>img(i,j-1) && img(i,j)>img(i,j+1)
            img_ns(i,j)=1;
        end
        if img(i,j)>img(i-1,j) && img(i,j)>img(i+1,j)
            img_ns(i,j)=1;
        end
    end
end

ns = img_ns(2:end-1,2:end-1);