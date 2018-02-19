function Sf = LS2Seval(CR, m, th, ph)

% (C) Wolfgang Erb 01.02.2018
% Computes the interpolation polynomial at spherical coordinates (th,ph) 
%------------------------------------------------------------------
% INPUT    
% m = [m1,m2]  : parameters of the Lissajous curve
% CR           : coefficient matrix of the interpolation polynomial
% (th,ph)      : evaluation points in spherical coordinates
%
% OUTPUT  
% Sf           : evaluated polynomial at point (th,ph)


% Computation of trigonometric polynomials evaluated at (x,y)
Txc = cos([0:m(1)]'*th);
Txs = sin([0:m(1)]'*th);

Tyc = [cos([0:2:m(2)-1]'*ph);cos([1:2:m(2)-1]'*ph)];
Tys = [sin([2:2:m(2)+1]'*ph);sin([1:2:m(2)-1]'*ph)];

% Evaluation of interpolation polynomial via summation (super compact)
Sf = sum([Txc'*CR(:,1:m(2)/2), Txs'*CR(:,m(2)/2+1:m(2))].*Tyc',2);
Sf = Sf + sum([Txc'*CR(:,m(2)+1:3*m(2)/2), Txs'*CR(:,3*m(2)/2+1:2*m(2))].*Tys',2);

return




