% for axial symmetry around z-axis only
function vxc = lda_chachiyo_vxc(rho, bra, ket)
    global Cx
    global a
    global b1
    global b2
    global box_size
    vxc = integral2(...
        @(x,z)...
        (...
            1/3 * ...
            (...
                -4 * Cx + ...
                ( a * ( b1 + 2 * b2 * rho(x,0,z).^(1/3) ) )...
                ./...
                ( 1 + b1 * rho(x,0,z).^(1/3) + b2 * rho(x,0,z).^(2/3) )...
            )...
            .* rho(x,0,z).^(1/3)...
            + a * log( 1 + b1 * rho(x,0,z).^(1/3) + b2 * rho(x,0,z).^(2/3) )...
        )...
        .* bra(x,0,z) .* ket(x,0,z) * 2 * pi .* x,...
        0, box_size, -box_size, box_size ...
    );
end