% This program plots spherical Lissajous curves and its node points 
% (C) Wolfgang Erb 01.02.2018

close all

% Parameters 

m = [6,6];           %frequencies of Lissajous curves, m(2) must be even
g = gcd(m(1),m(2));  

sizeB = 100;         %size of node points in plot

% Initialize
t = 0:0.001:2*pi;
x = zeros(g,length(t)); y = x; z = x;

% Calculate node points and convert in cartesian coordinates
[thLS, phLS] = LS2Spts(m);

xLS = sin(thLS).*cos(phLS);
yLS = sin(thLS).*sin(phLS);
zLS = cos(thLS);

% Calculate Lissajous trajectories

for i = 1:g
  x(i,:) = sin(m(2)*t/g).*cos(m(1)*t/g+(i-1)*2*pi/m(2));
  y(i,:) = sin(m(2)*t/g).*sin(m(1)*t/g+(i-1)*2*pi/m(2));
  z(i,:) = cos(m(2)*t/g);
end

% Start plot

figure

for i = 1:g
  plot3(x(i,:),y(i,:),z(i,:), 'Color' ,[183,207,246]/255,'LineWidth',2);
  hold on
end

M = sizeB*ones(length(xLS),1);

scatter3(xLS,yLS,zLS,M,'fill','MarkerFaceColor','b','MarkerEdgeColor','k');

set(gca,'FontSize',16);

xlabel('x'); ylabel('y'); zlabel('z');
title('Spherical Lissajous curve $\gamma^{(\underline{\mathbf{m}})}$ and node points $\mathbf{LS}^{(\underline{\mathbf{m}})}$', ...
'interpreter','latex','fontsize',16)

hold off

