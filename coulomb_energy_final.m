function energy = coulomb_energy_final(p_matrix, vijkl)
    energy = 0;
    for i = 1:length(p_matrix)
        for j = 1:length(p_matrix)
            for k = 1:length(p_matrix)
                for l = 1:length(p_matrix)
                    energy = energy + vijkl(i, j, k, l) *...
                        p_matrix(i, j) * p_matrix(k, l);
                end
            end
        end
    end
    energy = -energy / 2;
end