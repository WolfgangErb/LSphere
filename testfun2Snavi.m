function f = testfun2Snavi(x,y,z,kk)

%   INPUT    
%   x,y,z       cartesian coordinates on the sphere to evaluate functions
%   kk          index for one of the test functions
%
%   OUTPUT     
%   f           resulting function values

%   This program contains the test functions for the navigator example
%   Odd numbers: original function
%   Even numbers: rotated function

switch kk
               
    case 1  % Two gaussians
        
    f = exp(-3*((x).^2 + y.^2+(z-1).^2))+exp(-4*((x-1/sqrt(2)).^2 + (y+1/sqrt(2)).^2+(z).^2));
    
    case 2  % The rotated two gaussians
        
    a1 = 1.4;
    a2 = 0.2;
    a3 = 0.9;
        
    D1 = [cos(a1) -sin(a1) 0; sin(a1) cos(a1) 0; 0 0 1];
    D2 = [1 0 0; 0 cos(a2) -sin(a2); 0 sin(a2) cos(a2)];
    D3 = [cos(a3) 0 -sin(a3); 0 1 0; sin(a3) 0 cos(a3)];
        
    p = [x,y,z]*D1*D2*D3;
    x = p(:,1); y = p(:,2); z = p(:,3);
        
    f = exp(-3*((x).^2 + y.^2+(z-1).^2))+exp(-4*((x-1/sqrt(2)).^2 + (y+1/sqrt(2)).^2+(z).^2));
    
    case 3 % The cross
        
    f = max(exp(-40*x.^2).*exp(-8*(z-1).^2),exp(-40*y.^2).*exp(-8*(z-1).^2));
    
    case 4 % The rotated cross
    
    a1 = -0.4;
    a2 = 0.9;
    a3 = -0.3;
        
    D1 = [cos(a1) -sin(a1) 0; sin(a1) cos(a1) 0; 0 0 1];
    D2 = [1 0 0; 0 cos(a2) -sin(a2); 0 sin(a2) cos(a2)];
    D3 = [cos(a3) 0 -sin(a3); 0 1 0; sin(a3) 0 cos(a3)];
        
    p = [x,y,z]*D1*D2*D3;
    x = p(:,1); y = p(:,2); z = p(:,3);
    
    f = max(exp(-40*x.^2).*exp(-8*(z-1).^2),exp(-40*y.^2).*exp(-8*(z-1).^2));
    
    case 5  % A spherical harmonic
        
    K = [8,4];
    [ph,th,R] = cart2sph(x,y,z);
    th = pi/2-th;
    ph = mod(ph,2*pi);
        
    Ymn = legendre(K(1),cos(th));
    f = Ymn(K(2)+1,:)';

    f = f.*cos(K(2)*ph)/1850;
    
    case 6  % The rotated spherical harmonic
        
    K = [8,4];    
    a1 = 0.15;
    a2 = 0.35;
    a3 = 0.35;
        
    D1 = [cos(a1) -sin(a1) 0; sin(a1) cos(a1) 0; 0 0 1];
    D2 = [1 0 0; 0 cos(a2) -sin(a2); 0 sin(a2) cos(a2)];
    D3 = [cos(a3) 0 -sin(a3); 0 1 0; sin(a3) 0 cos(a3)];
        
    p = [x,y,z]*D1*D2*D3;
    x = p(:,1); y = p(:,2); z = p(:,3);
        
    [ph,th,R] = cart2sph(x,y,z);
    th = pi/2-th;
    ph = mod(ph,2*pi);
        
    Ymn = legendre(K(1),cos(th));
    f = Ymn(K(2)+1,:)';

    f = f.*cos(K(2)*ph)/1850;
    
    case 7
        
    f = cos(1-exp(-4*x.*y)-sin(7*z));
    
    case 8
        
    a1 = 0.4;
    a2 = 0.2;
    a3 = 0.3;
        
    D1 = [cos(a1) -sin(a1) 0; sin(a1) cos(a1) 0; 0 0 1];
    D2 = [1 0 0; 0 cos(a2) -sin(a2); 0 sin(a2) cos(a2)];
    D3 = [cos(a3) 0 -sin(a3); 0 1 0; sin(a3) 0 cos(a3)];
        
    p = [x,y,z]*D1*D2*D3;
    x = p(:,1); y = p(:,2); z = p(:,3);
        
    f = cos(1-exp(-4*x.*y)-sin(7*z));
        
    otherwise
        
    error('There is no function associated to this number');

end