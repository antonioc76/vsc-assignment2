syms dw1 dw2 dw3 Omega I1 I2 I3

% spin about b1
I_mat = diag([I1, I2, I3]);
omega_vec = [Omega + dw1; dw2; dw3];
H_b = I_mat * omega_vec;

pretty(H_b); %[output:9f9b5362]
%%
dw_i = I_mat \ cross(-omega_vec, H_b);
pretty(dw_i); %[output:70cf718a]
%%
dw_i = subs(dw_i, [dw1*dw2, dw1*dw3, dw2*dw3], [0, 0, 0]);
pretty(dw_i); %[output:65a1cef4]
dw_i = simplify(dw_i);
pretty(dw_i); %[output:698ccad5]
dw_i = subs(dw_i, [I1, I2, I3, Omega], [120, 100, 80, 1]) %[output:384b20a2]
pretty(dw_i) %[output:3782eb05]
%%
dw_i = simplify(dw_i);
zeroRows = all(isAlways(dw_i == 0), 2); %[output:9664f613] %[output:5e72241d]
dw_i = dw_i(~zeroRows, :);
pretty(dw_i) %[output:82cfb9df]
%%
x1 = [dw2; dw3] %[output:3e48ebb0]
A = jacobian(dw_i, x1) %[output:0f53fbc2]
[V, D] = eigs(double(A)) %[output:64a5378f] %[output:0da36ada]
answer = [1i/sqrt(10); -1i/sqrt(10)];
matlab = diag(D);

err = norm(matlab - answer) %[output:1c06fed8]

assert(err < 1e-12, 'incorrect eigenvalues')
disp("eigenvalues are the same"); %[output:7a966030]
V = V ./ V(1,1) %[output:35f32b32]
answer = [1, 1; -10j/(4*sqrt(10)), 10j/(4*sqrt(10))];
matlab = V;
err = norm(matlab - answer);
assert(err < 1e-12, 'incorrect eigenvectors')
disp("eigenvectors are the same"); %[output:573a4307]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[output:9f9b5362]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"$$ \\left(\\begin{array}{c}\nI_1 \\,{\\left(\\Omega +{\\textrm{dw}}_1 \\right)}\\\\\nI_2 \\,{\\textrm{dw}}_2 \\\\\nI_3 \\,{\\textrm{dw}}_3 \n\\end{array}\\right) $$"}}
%---
%[output:70cf718a]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"$$ \\left(\\begin{array}{c}\n\\frac{I_2 \\,{\\textrm{dw}}_2 \\,{\\textrm{dw}}_3 -I_3 \\,{\\textrm{dw}}_2 \\,{\\textrm{dw}}_3 }{I_1 }\\\\\n-\\frac{I_1 \\,\\Omega \\,{\\textrm{dw}}_3 -I_3 \\,\\Omega \\,{\\textrm{dw}}_3 +I_1 \\,{\\textrm{dw}}_1 \\,{\\textrm{dw}}_3 -I_3 \\,{\\textrm{dw}}_1 \\,{\\textrm{dw}}_3 }{I_2 }\\\\\n\\frac{I_1 \\,\\Omega \\,{\\textrm{dw}}_2 -I_2 \\,\\Omega \\,{\\textrm{dw}}_2 +I_1 \\,{\\textrm{dw}}_1 \\,{\\textrm{dw}}_2 -I_2 \\,{\\textrm{dw}}_1 \\,{\\textrm{dw}}_2 }{I_3 }\n\\end{array}\\right) $$"}}
%---
%[output:65a1cef4]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"$$ \\left(\\begin{array}{c}\n0\\\\\n-\\frac{I_1 \\,\\Omega \\,{\\textrm{dw}}_3 -I_3 \\,\\Omega \\,{\\textrm{dw}}_3 }{I_2 }\\\\\n\\frac{I_1 \\,\\Omega \\,{\\textrm{dw}}_2 -I_2 \\,\\Omega \\,{\\textrm{dw}}_2 }{I_3 }\n\\end{array}\\right) $$"}}
%---
%[output:698ccad5]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"$$ \\left(\\begin{array}{c}\n0\\\\\n-\\frac{\\Omega \\,{\\textrm{dw}}_3 \\,{\\left(I_1 -I_3 \\right)}}{I_2 }\\\\\n\\frac{\\Omega \\,{\\textrm{dw}}_2 \\,{\\left(I_1 -I_2 \\right)}}{I_3 }\n\\end{array}\\right) $$"}}
%---
%[output:384b20a2]
%   data: {"dataType":"symbolic","outputData":{"name":"dw_i","value":"$$ \\left(\\begin{array}{c}\n0\\\\\n-\\frac{2\\,{\\textrm{dw}}_3 }{5}\\\\\n\\frac{{\\textrm{dw}}_2 }{4}\n\\end{array}\\right) $$"}}
%---
%[output:3782eb05]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"$$ \\left(\\begin{array}{c}\n0\\\\\n-\\frac{2\\,{\\textrm{dw}}_3 }{5}\\\\\n\\frac{{\\textrm{dw}}_2 }{4}\n\\end{array}\\right) $$"}}
%---
%[output:9664f613]
%   data: {"dataType":"warning","outputData":{"text":"Warning: Unable to prove 'dw2\/4 == 0'."}}
%---
%[output:5e72241d]
%   data: {"dataType":"warning","outputData":{"text":"Warning: Unable to prove '-(2*dw3)\/5 == 0'."}}
%---
%[output:82cfb9df]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"$$ \\left(\\begin{array}{c}\n-\\frac{2\\,{\\textrm{dw}}_3 }{5}\\\\\n\\frac{{\\textrm{dw}}_2 }{4}\n\\end{array}\\right) $$"}}
%---
%[output:3e48ebb0]
%   data: {"dataType":"symbolic","outputData":{"name":"x1","value":"$$ \\left(\\begin{array}{c}\n{\\textrm{dw}}_2 \\\\\n{\\textrm{dw}}_3 \n\\end{array}\\right) $$"}}
%---
%[output:0f53fbc2]
%   data: {"dataType":"symbolic","outputData":{"name":"A","value":"$$ \\left(\\begin{array}{cc}\n0 & -\\frac{2}{5}\\\\\n\\frac{1}{4} & 0\n\\end{array}\\right) $$"}}
%---
%[output:64a5378f]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"V","rows":2,"type":"complex","value":[["0.7845 + 0.0000i","0.7845 + 0.0000i"],["0.0000 - 0.6202i","0.0000 + 0.6202i"]]}}
%---
%[output:0da36ada]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"D","rows":2,"type":"complex","value":[["0.0000 + 0.3162i","0.0000 + 0.0000i"],["0.0000 + 0.0000i","0.0000 - 0.3162i"]]}}
%---
%[output:1c06fed8]
%   data: {"dataType":"textualVariable","outputData":{"name":"err","value":"0"}}
%---
%[output:7a966030]
%   data: {"dataType":"text","outputData":{"text":"eigenvalues are the same\n","truncated":false}}
%---
%[output:35f32b32]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"V","rows":2,"type":"complex","value":[["1.0000 + 0.0000i","1.0000 + 0.0000i"],["0.0000 - 0.7906i","0.0000 + 0.7906i"]]}}
%---
%[output:573a4307]
%   data: {"dataType":"text","outputData":{"text":"eigenvectors are the same\n","truncated":false}}
%---
