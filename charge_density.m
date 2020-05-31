function rho = charge_density(p_matrix, basis_set, x, y, z)
    rho = 0;
    for i = 1:length(basis_set)
        for j = 1:length(basis_set)
            rho = rho + p_matrix(i, j) .* ...
                basis_set{i}(x, y, z) .* basis_set{j}(x, y, z);
        end
    end
end