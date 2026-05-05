function img_ns= cost_detection(img, th,line)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% extract the costline from img
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% img:      line_euh (with bacin from river)
% th:       threshold for suppressing weak edges
% line:     cost line from eea
% img_ns:   gradient image after non maxima suppression
% img_thin: mask of coast line after thining and comparison with line_eea
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n=33;   %space domain 
sigma = 2;%[1.6,1.8, 1.9,2];%,2,3,4];  %standard deviation
l = length(sigma);
%create guassian kernel bank
g = zeros(n,n,l);
for i =1:l
    g(:,:,i) = fspecial('gaussian',n,sigma(i));
end

delta_x = [-1 0 1];
delta_y = delta_x';
dx = zeros(n,n,l);
dy = zeros(n,n,l);

%create and show derivates bank
for i = 1:l
    dx(:,:,i) = conv2(g(:,:,i),delta_x,'same');
    dy(:,:,i) = conv2(g(:,:,i),delta_y,'same');
end

%filtering images
img_dx = zeros(size(img,1),size(img,2),l);
img_dy = zeros(size(img,1),size(img,2),l);
for i =1:l
    img_dx(:,:,i) = imfilter(img,dx(:,:,i)); 
    img_dy(:,:,i) = imfilter(img,dy(:,:,i));
end
% create gradient image
img_grad = sqrt(img_dx.^2+img_dy.^2);

% suppresion of weak edges
img_supp = img_grad;
img_supp(img_grad<th)=0;
img_supp(img_grad>=th)=1;

figure();
imshow(img_supp);
%save('Th_comp1.mat',"img_supp");
%title('After derivative of gaussian edge detection');

%%% Deleting Fake Edges from line_euh %%%
% using line_eea as reference for deleting fake edges
for i =1:l
    img_t = bwmorph(img_supp(:,:,i),'thin');
    %figure();
    %imshow(img_t);
    %save('img_t');
    %title('After thinning operation');
    w_size = 10; %30
    [M,N] = size(line);
    line2 = padarray(line,[w_size,w_size]);    
    mask2 = zeros(size(line2));
    img_t2 = padarray(img_t,[w_size,w_size]);
    for ii = w_size+1:w_size+M
        for jj = w_size+1:w_size+N
            if img_t2(ii,jj)==1
                temp = line2(ii-w_size:ii+w_size,jj-w_size:jj+w_size);
                if sum(temp(:))>0
                    mask2(ii,jj)=1;
                end
            end
        end
    end
    img_thin(:,:,i)=mask2(w_size+1:end-w_size,w_size+1:end-w_size);
    % figure();
    % imshow(img_thin);
    % title('After padding and refining operation');
    img_ns(:,:,i) = nonmaximasuppression(img_grad(:,:,i).*img_thin(:,:,i));
    % figure();
    % imshow(img_thin);
    % save('img_thin');
    % title('After non maxima supp. operation');
end




