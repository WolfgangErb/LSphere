% Main example for spectral interpolation
% on the nodes of spherical Lissajous curves 
% (C) Wolfgang Erb 01.02.2018

% Parameters 

clear all
close all

m       = [12,12];        % Parameter of Lissajous curve

nofun   = 3;              % Number of test function [1-6]
parfun  = [6,6];          % Additional parameter of test function

N       = 156;            % Discretization for spherplotter

% Coordinates and weights of LS points
tic; [thLS, phLS] = LS2Spts(m);
        
% Extraction of function values
f = testfun2S(thLS,phLS,nofun,parfun); 
      
% Computation of Coefficient Matrix
G = LS2SdatM(m,f); 
[CC,CR] = LS2Scfsfft(m,G); 

% Clenshaw-Curtis-Nodes (in spherical coordinates) for sphereplotter
X = ccnodes(N);

% Values of the interpolation polynomial for X and on Lissajous nodes
Sf = LS2Seval(CR,m,X(1,:),X(2,:));       
Sfint = LS2Seval(CR,m,thLS',phLS'); 
elapsedtime = toc;

% Plot the interpolated function
sphereplotter(Sf,X',N,0);  
              
% Calculation of the maximal error between function and polynomial interpolation
maxError = max(abs(Sf-testfun2S(X(1,:)',X(2,:)',nofun,parfun)));
maxErrorInt = max(abs(f-Sfint));

fprintf('Main test example for interpolation on spherical Lissajous curves\n');
fprintf('-----------------------------------------------------------------\n');
fprintf('Elapsed time for interpolation: %10.5f \n',elapsedtime);
fprintf('Maximal error at interpolation points: %16.14f \n',maxErrorInt);
fprintf('Maximal approximation error: %16.14f \n\n',maxError);
        


