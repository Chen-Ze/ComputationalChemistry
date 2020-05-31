function [V,D] = scf_eigen(H, S)
    H_prime = (S^(-1/2))' * H * S^(-1/2);
    [V_prime, D] = eig(H_prime, 'vector');
    [D, ind] = sort(D);
    V_prime = V_prime(:, ind);
    V = (S^(-1/2)) * V_prime;
end