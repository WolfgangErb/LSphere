function [thLS, phLS] = LS2Spts(m)

% (C) Wolfgang Erb 01.02.2018
% Computes Lissajous nodes with parameter m1, m2
%-------------------------------------------------------------------------
% INPUT   
% m=[m1,m2]    : parameters of the Lissajous curve
%
% OUTPUT  
% thLS,phLS    : theta and phi-coordinates of the Lissajous nodes

% Determination of points
zth = linspace(0,1,m(1)+1)*pi;
zph = linspace(0,1,2*m(2))*pi/m(2)*(2*m(2)-1);

[LS1,LS2] = meshgrid(zph,zth);
 
% Selection of used points
[M1,M2] = meshgrid(0:2*m(2)-1,0:m(1));
findM = find(mod(M1+M2+1,2));

phLS = LS1(findM);
thLS = LS2(findM);

return


