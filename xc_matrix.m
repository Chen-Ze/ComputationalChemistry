function Vxc = xc_matrix(rho, basis_set)
    Vxc = zeros(length(basis_set));
    for i = 1:length(basis_set)
        for j = 1:length(basis_set)
            Vxc(i, j) = lda_chachiyo_vxc(rho, basis_set{i}, basis_set{j});
        end
    end
end