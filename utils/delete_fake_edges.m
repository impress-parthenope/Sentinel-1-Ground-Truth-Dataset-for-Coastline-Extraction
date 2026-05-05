function out = delete_fake_edges(img,edges,w_size);
[M,N] = size(img);
for i = w_size+1:M-w_size-1
    for j = w_size+1:N-w_size-1
        if edges(i,j)==1
            w1 = img(i-w_size:i+w_size,j-w_size:j-1);
            w2 = img(i-w_size:i+w_size,j+1:j+w_size);
            w3 = img(i-w_size:i-1,j-w_size:j+w_size);
            w4 = img(i+1:i+w_size,j-w_size:j+w_size);
            
            ratio1 = max(mean(mean(w1./w2)),mean(mean(w2./w1)));
            ratio2 = max(mean(mean(w3./w4)),mean(mean(w4./w3)));
            
            out(i,j) =0.5*(ratio1+ratio2);
        end
    end
end
end