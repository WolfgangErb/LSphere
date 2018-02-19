% Plot Lagrange basis functions for spherical Lissajous node points 
% (C) Wolfgang Erb 01.02.2018

% Parameters 

clear all
close all

m = [30,30];              % Parameters of spherical Lissajous curve
N = 156;                  % Discretization size for spherplotter
K = 5;                    % Index for Lagrange basis function

% Coordinates and weights of LS points
tic; [thLS, phLS] = LS2Spts(m);
        
% Extraction of Lagrange function values
f = zeros(length(thLS),1);
f(6) = 1;

% Computation of Coefficient Matrix
G = LS2SdatM(m,f); 
[CC,CR] = LS2Scfsfft(m,G); 

% Clenshaw-Curtis-Nodes (in spherical coordinates) for sphereplotter
X = ccnodes(N);

% Values of the interpolation polynomial for X
Sf = LS2Seval(CR,m,X(1,:),X(2,:));       
elapsedtime = toc;

% Plot the interpolated function
sphereplotter(Sf,X',N,0); 