function f = testfun2S(theta,phi,kk,K)

%   INPUT    
%   theta,phi   spherical coordinates to evaluate the functions
%   kk          index for one of the test functions
%   K           parameter for the test function
%
%   OUTPUT     
%   f           resulting function values

% In case we need cartesian coordinates
x = sin(theta).*cos(phi); y = sin(theta).*sin(phi); z = cos(theta);

switch kk
               
    case 1  % Basis function I
     
    if mod(K(2),2) == 0
       f = cos(K(1)*theta).*exp(i*K(2)*phi);
    else
       f = i*sin(K(1)*theta).*exp(i*K(2)*phi); 
    end
    
    f = real(f);
        
    case 2  % Basis function II
    
    if mod(K(2),2) == 0
       f = cos(K(1)*theta).*exp(i*K(2)*phi);
    else
       f = i*sin(K(1)*theta).*exp(i*K(2)*phi); 
    end
    
    f = imag(f);
    
    case 3  % Two Gaussians
        
    f = exp(-3*((x).^2 + y.^2+(z-1).^2))+exp(-4*((x-1/sqrt(2)).^2 + (y+1/sqrt(2)).^2+(z).^2));
        
    case 4  % The cross
    
    f = max(exp(-40*x.^2).*exp(-8*(z-1).^2),exp(-40*y.^2).*exp(-8*(z-1).^2));
    
    case 5  % Characteristic function of spherical segment
        
    f = double(theta>0.8).*double(theta<1.4).*double(phi>4.5).*double(phi<5.2);
    
    case 6  % Spherical harmonic of order K
        
    Ymn = legendre(K(1),cos(theta));
    f = Ymn(K(2)+1,:)';

    f = f.*cos(K(2)*phi);
    f = f/norm(f,inf);
    
    otherwise
        
    error('There is no function associated to this number');

end