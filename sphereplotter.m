function sphereplotter(data,X,K,scalefactor)

% Plotter for functions on the sphere
% (C) Wolfgang Erb 01.02.2018

Ncolumns = 2*K+2;
Nrows = 2*K-1;

rho = 1;
scale = scalefactor*ones(Nrows+2,Ncolumns+1)/max(abs(data));
np = data(1);
sp = data(end);

data = reshape(data(2:end-1,1),Ncolumns,Nrows);
data = [np*ones(1,Ncolumns); data'; sp*ones(1,Ncolumns)];
data = [data, data(:,1)];

Theta = reshape(X(2:end-1,1),Ncolumns,Nrows);
Theta = [zeros(1,Ncolumns);Theta'; pi*ones(1,Ncolumns)];
Theta = [Theta, Theta(:,1)];

Phi = reshape(X(2:end-1,2),Ncolumns,Nrows);
Phi = [Phi(:,1)'; Phi'; Phi(:,1)'];
Phi = [Phi, 0*ones(Nrows+2,1)];

c = rho*ones(Nrows+2,Ncolumns+1) + scale.*data;

kx= c.*sin(Theta).*cos(Phi);
ky= c.*sin(Theta).*sin(Phi);
kz= c.*cos(Theta);

figure

surf(kx,ky,kz, data,'EdgeColor','none') 
colormap hot
lighting gouraud
shading interp
set(gca, 'cameraviewangle', 10)
axis equal

view(30,30)

return;