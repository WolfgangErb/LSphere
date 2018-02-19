function [CC,CR] = LS2Scfsfft(m,G)

% (C) Wolfgang Erb 01.02.2018
% Computes the coefficient matrix of the interpolating polynomial
%----------------------------------------------------------------------
% INPUT    
% m = [m1,m2]  : parameters of Lissajous curve
% G            : (2 m1) x (2 m2) data matrix

% Output 
% CC           : (m1+1) x (2 m2) coefficient matrix (complex)
% CR           : (m1+1) x (2 m2) coefficient matrix (real)

% 2D Fourier transform of G
Gh = fft2(G);

% Generate mask for coefficients
[M2,M1] = meshgrid(0:2*m(2)-1,0:2*m(1)-1);

Mask = 2*(double(M1*m(2)+M2*m(1)<m(1)*m(2)) + double(M1*m(2)+(2*m(2)-M2)*m(1)<m(1)*m(2)));
Meq  = double(M1*m(2)+M2*m(1)==m(1)*m(2)) + double(M1*m(2)+(2*m(2)-M2)*m(1)==m(1)*m(2));
Mask = Mask + Meq;

Mask(1,2:2:end) = zeros(1,m(2)); Mask(1,1:2:end) = ones(1,m(2));
Mask(1,m(2)+1) = 0;

% Coefficients for complex valued basis
CC = Gh.*Mask;
CC = CC(1:m(1)+1,:);

% Coefficients for real valued basis
CR = [2*real(CC(:,1:2:m(2))),-2*imag(CC(:,2:2:m(2))),-2*imag(CC(:,3:2:m(2)+1)),2*real(CC(:,2*m(2):-2:m(2)+1))];
CR(:,1)=CR(:,1)/2;
       
return