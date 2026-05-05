function y = lapl_gauss(hs,sigma)
x = [-floor(hs/2):floor(hs/2)];
y = [-floor(hs/2):floor(hs/2)];
[x,y]=meshgrid(x,y);

lapl = (x.^2 + y.^2 - 2*(sigma.^2))/(sigma.^4);
esp = exp(-(x.^2 + y.^2)/(2*sigma.^2));
lapl = lapl.*esp;
y = lapl./sum(sum(esp));