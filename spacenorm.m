function n=spacenorm(x,y,z,u,v,w)
    if nargin < 4
        u = 0; v = 0; w = 0;
    end
    n = (x - u).^2 + (y - v).^2 + (z - w).^2;
end