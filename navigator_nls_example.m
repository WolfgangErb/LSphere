% Main example to estimate rotations of an object on the sphere
% based on sample measurements at the nodes of spherical Lissajous curves
% (C) Wolfgang Erb 01.02.2018


function navigator_nls_example

close all
clear all

% Define global variables (for non linear least squares subroutine)
global mm 
global pLS 
global CRref
global gref

% Main parameters
mm = [15,16];                 % Parameters for Lissajous curve
nofun = 1;                    % Number of test function

% Set up Lissajous points
[thLS, phLS] = LS2Spts(mm);
xLS = sin(thLS).*cos(phLS); 
yLS = sin(thLS).*sin(phLS); 
zLS = cos(thLS);
pLS = [xLS,yLS,zLS];

% Navigator data - initial system
fref = testfun2Snavi(pLS(:,1),pLS(:,2),pLS(:,3),2*nofun-1); 
G = LS2SdatM(mm,fref); 
[~,CRref] = LS2Scfsfft(mm,G); 

% Navigator data - rotated system
gref = testfun2Snavi(pLS(:,1),pLS(:,2),pLS(:,3),2*nofun); 

% Initial value for non-linear least squares
a0 = [0;0;0];
A = a0;

% Execute non-linear iterative least squares
options = optimset('lsqnonlin');
options = optimset(options,'Display','iter');
tic;
[a,resnorm,~,~,output] = lsqnonlin('navigator',a0,[],[],options);
elapsedtime=toc;

A = [A,a];
steps = [0,output.iterations];

% Display results
disp('------------------');
disp('Iteration Results:');
disp('------------------');
for i = 1:2
   fprintf('Euler angles after %2i steps: %8.5f, %8.5f, %8.5f \n',steps(i),A(1,i),A(2,i),A(3,i));
end
disp('------------------');
fprintf('Elapsed time: %8.5f \n',elapsedtime);
fprintf('Residual after convergence: %6.2g \n',resnorm);

%Initialize grid for plots
N = 156; 
X = ccnodes(N);

% Plot the interpolated original function
Sf = LS2Seval(CRref,mm,X(1,:),X(2,:)); 
sphereplotter(Sf,X',N,0);  
% print -dpng figure1.png 

% Generate rotated function
D1 = [cos(a(1)) -sin(a(1)) 0; sin(a(1)) cos(a(1)) 0; 0 0 1];
D2 = [1 0 0; 0 cos(a(2)) -sin(a(2)); 0 sin(a(2)) cos(a(2))];
D3 = [cos(a(3)) 0 -sin(a(3)); 0 1 0; sin(a(3)) 0 cos(a(3))];

pLSrot = pLS*D1*D2*D3;

g = testfun2Snavi(pLSrot(:,1),pLSrot(:,2),pLSrot(:,3),2*nofun-1); 
Gg = LS2SdatM(mm,g); 
[~,CR] = LS2Scfsfft(mm,Gg); 

Sg = LS2Seval(CR,mm,X(1,:),X(2,:)); 

% Plot the interpolated rotated function
sphereplotter(Sg,X',N,0); 
% print -dpng figure2.png 

return;


