function Vee = two_electron_braket(vijkl, p_matrix)
    Vee = zeros(size(p_matrix));
    for i = 1:length(p_matrix)
        for j = 1:length(p_matrix)
            for k = 1:length(p_matrix)
                for l = 1:length(p_matrix)
                    Vee(i, j) = Vee(i, j) +... 
                        p_matrix(k, l) * vijkl(i, j, k, l);
                end
            end
        end
    end
end