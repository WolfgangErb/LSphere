function G = LS2SdatM(m,f)

% (C) Wolfgang Erb 01.02.2018
% Generates the data matrix from the function evaluations
%--------------------------------------------------------
% INPUT    
% m = [m1,m2]  : parameters of Lissajous curve
% f            : function values at LS points

% Output
% G            : (2 m1) x ( 2 m2) data matrix

% Generation of Data Matrix
[M2,M1] = meshgrid(0:2*m(2)-1,0:m(1));
findM = find(mod(M1+M2+1,2));

Gh = zeros((m(1)+1)*2*m(2),1);
Gh(findM) = f/m(1)/m(2)/2;
Gh = reshape(Gh,size(M1));

Gh2 = Gh(end:-1:1,:);
Gh2 = circshift(Gh2',m(2))';
Gh2 = Gh2(2:end-1,:);

G = [Gh;Gh2];

return