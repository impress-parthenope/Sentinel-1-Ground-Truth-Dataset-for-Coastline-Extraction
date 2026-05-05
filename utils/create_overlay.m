function [overlay,mask_] = create_overlay(img1,mask)
%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% overlap mask (coast line) on img1 (sensor image)%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
idx1 = find(mask==1);
idx0 = find(mask==0);

overlay = zeros(size(img1));
mask_ = zeros(size(img1));
overlay(idx1)=1; overlay(idx0)=img1(idx0);
mask_(idx1)=1;

end

