function z = incomplete_gamma(w)
    z = integral(@(t)exp(-w * t.^2), 0, 1);
end