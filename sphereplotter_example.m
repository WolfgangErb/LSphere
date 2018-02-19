% Test sphereplotter

close all
clear all

% Radius for data on sphere
R = 1;   

% degree (bandwidth) of spherical harmonics expansions
N = 156;                                     

% Clenshaw-Curtis-Nodes (in spherical coordinates)
X = ccnodes(N);

% Compute respective cartesian coordinates
x = R*sin(X(1,:)').*cos(X(2,:)'); 
y = R*sin(X(1,:)').*sin(X(2,:)');
z = R*cos(X(1,:)');

% Function f
f = exp(-2*((x).^2 + y.^2+(z-1).^2))+2*exp(-4*((x-0.5).^2 + y.^2+(z).^2));

% Plot the function f
sphereplotter(f,X',N,0.5);



