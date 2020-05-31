function phi = phi1s(alpha, x0, y0, z0)
    phi = @(x,y,z) (2 * alpha / pi)^(3/4) * ...
        exp( -alpha * ( (x - x0).^2 + (y - y0).^2 + (z - z0).^2 ) );
end