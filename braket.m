function result = braket(bra,ket)
    result = integral3(@(x,y,z)(bra(x,y,z) .* ket(x,y,z)), -Inf, Inf, -Inf, Inf, -Inf, Inf);
end