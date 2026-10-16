%% part a
I_in_b = [128 32 4;
            32 116 28;
            4 28 98];

[V, D] = eigs(I_in_b); 

lambdas = diag(D);
eigen_vectors = V;

[lambdas, idx] = sort(lambdas, 'descend')

eigen_vectors = eigen_vectors(:, idx)

%% part b

tol = 1e-12;

assert(norm((V' * V) - eye(3), 'fro') < tol, 'neq, fail')

A = V' * I_in_b * V;

off_diag = A - diag(diag(A));

assert(norm(off_diag, 'fro') < tol, 'not diagonal, fail')

%% part c

I1 = lambdas(1);
I2 = lambdas(2);
I3 = lambdas(3);
omega = 1;

A1 = [0, -(I1 - I3) * omega / I2;
    (I1 - I2 ) * omega / I3, 0];

[v1,d1] = eigs(A1)

A2 = [0, (I2 - I3) * omega / I1;
    (I1 - I2) * omega / I3, 0];

[v2,d2] = eigs(A2)

A3 = [0, (I2 - I3 ) * omega / I1;
    -(I1 - I3) * omega / I2, 0];

[v3,d3] = eigs(A3)

