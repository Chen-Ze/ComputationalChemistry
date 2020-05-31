basis;
lda_chachiyo_consts;
occupations = [2 0 0 0 0 0];
T = kinetic_int(phi1salpha, phi1sR0);
VN = nuclei_electron_int(phi1salpha, phi1sR0, nucleiR0, nucleiZ);
S = overlap_int(phi1salpha, phi1sR0);
Vijkl = two_electron_int(phi1salpha, phi1sR0);
[V,D] = scf_eigen(T + VN, S);
loop_count = 0;
while 1
    loop_count = loop_count + 1;
    fprintf("Round %d starts.\n", loop_count);
    P = density_matrix(V, occupations);
    rho = @(x,y,z) charge_density(P, phi1sbasis, x, y, z);
    Vee = two_electron_braket(Vijkl,P);
    Vxc = xc_matrix(rho, phi1sbasis);
    D_prev = D;
    [V,D] = scf_eigen(T + VN + Vee + Vxc, S);
    if max(abs(D_prev - D)) < 1e-6
        break
    end
    fprintf("Max e difference %d, next round.\n", max(abs(D_prev - D)));
end
total_energy = ...
    occupations * D + coulomb_energy_final(P,Vijkl) + ...
    exc_final(rho) - vxc_int_final(rho) + nucleiZ{1} * nucleiZ{2} / H2_r0;
fprintf("Total energy: %f.\n", total_energy);
[X,Z] = meshgrid(-1:0.1:1,-2:0.1:3.4);
RHO = rho(X,0,Z);
surf(X,Z,RHO)
