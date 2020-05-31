% for GTO 1s only
function V = nuclei_electron_int(...
        basis_alphas, basis_centers, nuclei_centers, nuclei_z ...
    )
    V = zeros(length(basis_alphas), length(basis_alphas));
    for i = 1:length(basis_alphas)
        for j = 1:length(basis_alphas)
            a = basis_alphas{i};
            b = basis_alphas{j};
            ra = basis_centers{i};
            rb = basis_centers{j};
            rp = (a * ra + b * rb) / (a + b);
            for k = 1:length(nuclei_centers)
                rn = nuclei_centers{k};
                V(i,j) = V(i,j) - nuclei_z{k} *...
                (2 * a / pi)^(3/4) *...
                (2 * b / pi)^(3/4) *...
                exp(-a * b / (a + b) * norm(ra - rb)^2 ) * ...
                2 * pi / (a + b) * ...
                incomplete_gamma((a + b) * norm(rp - rn)^2);
            end
        end
    end
end