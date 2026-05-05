function out = delete_sparse_pixel(mask3)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% delete from mask3 single pixel close to edges%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mask_ = zeros(3,3);
mask_vert = mask_;
mask_vert(1:end,2)=1;
mask_oriz = mask_vert';
mask_vert1 = mask_;
mask_vert1(1:end,1) = 1;
mask_oriz1 = mask_vert1';

mask_vert2 = mask_;
mask_vert2(1:end,3) = 1;
mask_oriz2 = mask_vert2';
mask_obli1 = eye(3);
mask_obli2 = fliplr(mask_obli1);

out=mask3;
[M,N] = size(mask3);

for i = 2:M-1
    for j = 2:N-1
        temp = mask3(i-1:i+1,j-1:j+1);
        dir_vert = sum(sum(temp.*mask_vert));
        dir_hori = sum(sum(temp.*mask_oriz));        
        dir_vert1 = sum(sum(temp.*mask_vert1));
        dir_vert2 = sum(sum(temp.*mask_vert2));
        dir_hori1 = sum(sum(temp.*mask_oriz1));
        dir_hori2 = sum(sum(temp.*mask_oriz2));
        dir_obli1 = sum(sum(temp.*mask_obli1));
        dir_obli2 = sum(sum(temp.*mask_obli2));
        if sum(temp(:))<3           %elimina i pixel spuri
            out(i,j)=0;
        end
        if sum(temp(:))~=3          %se ci sono più tre pixel in una finestra quadrata
            if dir_obli1+dir_obli2==3
                continue;
            elseif dir_vert==3 || dir_hori==3
                continue;
            elseif dir_vert1==3 || dir_vert2==3 || dir_hori1==3 || dir_hori2==3    %cancella il pixel centrale che non fa parte della curva
                out(i,j)=0;
            end
        end
    end
end
