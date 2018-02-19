function error = navigator(a)

global pLS 
global gref 
global mm
global CRref

D1 = [cos(a(1)) -sin(a(1)) 0; sin(a(1)) cos(a(1)) 0; 0 0 1];
D2 = [1 0 0; 0 cos(a(2)) -sin(a(2)); 0 sin(a(2)) cos(a(2))];
D3 = [cos(a(3)) 0 -sin(a(3)); 0 1 0; sin(a(3)) 0 cos(a(3))];

pLSrot = pLS*D1*D2*D3;
                                
[phrot,throt,R] = cart2sph(pLSrot(:,1),pLSrot(:,2),pLSrot(:,3));
throt = pi/2-throt;
phrot = mod(phrot,2*pi);

fint = LS2Seval(CRref,mm,throt',phrot'); 

error = gref - fint;

return