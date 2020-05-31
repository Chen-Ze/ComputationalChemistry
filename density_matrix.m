function P = density_matrix(coeff, occupations)
    P = coeff * diag(occupations) * coeff';
end