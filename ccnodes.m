% Calculate equidistant samples in spherical coordinates for sphereplotter

function X = ccnodes(n)

% equispaced nodes for latitude
theta = pi*(1:(2*n-1))/(2*n);
% equispaced nodes for longitude
phi = 2*pi*(0:(2*n+1))/(2*n+2);

[X,Y] = meshgrid(theta,phi);

% reorder points in two rows with (2*n+2)(2*n-1)+2 entries 
X = [X(:),Y(:)]';
X = [[0;0],X,[pi;0]];

return;