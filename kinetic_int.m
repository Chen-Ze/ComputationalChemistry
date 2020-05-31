% for GTO 1s only
function T = kinetic_int(basis_alphas, basis_centers)
    T = zeros(length(basis_alphas), length(basis_alphas));
    S = overlap_int(basis_alphas, basis_centers);
    for i = 1:length(basis_alphas)
        for j = 1:length(basis_alphas)
            a = basis_alphas{i};
            b = basis_alphas{j};
            T(i,j) = ...
                (a * b / (a + b)) * ...
                (...
                    3 - 2 * a * b / (a + b)...
                    * norm(basis_centers{i} - basis_centers{j})^2 ...
                );
        end
    end
    T = T .* S;
end