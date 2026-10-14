syms dw1 dw2 dw3 Omega I1 I2 I3

% spin about b1
I_mat = diag([I1, I2, I3]);
omega_vec = [dw1; dw2; Omega + dw3];
H_b = I_mat * omega_vec;

pretty(H_b); %[output:8a2fd115]
dw_i = I_mat \ cross(-omega_vec, H_b);
pretty(dw_i); %[output:37b9272d]
dw_i = subs(dw_i, [dw1*dw2, dw1*dw3, dw2*dw3], [0, 0, 0]);
pretty(dw_i); %[output:751d5f17]
dw_i = subs(dw_i, [I1, I2, I3, Omega], [120, 100, 80, 1]) %[output:268f2729]
pretty(dw_i) %[output:8eeab0de]

dw_i = simplify(dw_i);
zeroRows = all(isAlways(dw_i == 0), 2); %[output:35654fa4] %[output:62f9a92b]
dw_i = dw_i(~zeroRows, :);
pretty(dw_i) %[output:8ceb1107]
x2 = [dw1; dw2];
A = jacobian(dw_i, x2) %[output:9f7d23b5]
[V, D] = eigs(double(A)) %[output:992f07d9] %[output:01962fb7]
V = V ./ V(1,1) %[output:5235fbd6]
D %[output:6860ebf0]

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[output:8a2fd115]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"$$ \\left(\\begin{array}{c}\nI_1 \\,{\\textrm{dw}}_1 \\\\\nI_2 \\,{\\textrm{dw}}_2 \\\\\nI_3 \\,{\\left(\\Omega +{\\textrm{dw}}_3 \\right)}\n\\end{array}\\right) $$"}}
%---
%[output:37b9272d]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"$$ \\left(\\begin{array}{c}\n\\frac{I_2 \\,\\Omega \\,{\\textrm{dw}}_2 -I_3 \\,\\Omega \\,{\\textrm{dw}}_2 +I_2 \\,{\\textrm{dw}}_2 \\,{\\textrm{dw}}_3 -I_3 \\,{\\textrm{dw}}_2 \\,{\\textrm{dw}}_3 }{I_1 }\\\\\n-\\frac{I_1 \\,\\Omega \\,{\\textrm{dw}}_1 -I_3 \\,\\Omega \\,{\\textrm{dw}}_1 +I_1 \\,{\\textrm{dw}}_1 \\,{\\textrm{dw}}_3 -I_3 \\,{\\textrm{dw}}_1 \\,{\\textrm{dw}}_3 }{I_2 }\\\\\n\\frac{I_1 \\,{\\textrm{dw}}_1 \\,{\\textrm{dw}}_2 -I_2 \\,{\\textrm{dw}}_1 \\,{\\textrm{dw}}_2 }{I_3 }\n\\end{array}\\right) $$"}}
%---
%[output:751d5f17]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"$$ \\left(\\begin{array}{c}\n\\frac{I_2 \\,\\Omega \\,{\\textrm{dw}}_2 -I_3 \\,\\Omega \\,{\\textrm{dw}}_2 }{I_1 }\\\\\n-\\frac{I_1 \\,\\Omega \\,{\\textrm{dw}}_1 -I_3 \\,\\Omega \\,{\\textrm{dw}}_1 }{I_2 }\\\\\n0\n\\end{array}\\right) $$"}}
%---
%[output:268f2729]
%   data: {"dataType":"symbolic","outputData":{"name":"dw_i","value":"$$ \\left(\\begin{array}{c}\n\\frac{{\\textrm{dw}}_2 }{6}\\\\\n-\\frac{2\\,{\\textrm{dw}}_1 }{5}\\\\\n0\n\\end{array}\\right) $$"}}
%---
%[output:8eeab0de]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"$$ \\left(\\begin{array}{c}\n\\frac{{\\textrm{dw}}_2 }{6}\\\\\n-\\frac{2\\,{\\textrm{dw}}_1 }{5}\\\\\n0\n\\end{array}\\right) $$"}}
%---
%[output:35654fa4]
%   data: {"dataType":"warning","outputData":{"text":"Warning: Unable to prove '-(2*dw1)\/5 == 0'."}}
%---
%[output:62f9a92b]
%   data: {"dataType":"warning","outputData":{"text":"Warning: Unable to prove 'dw2\/6 == 0'."}}
%---
%[output:8ceb1107]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"$$ \\left(\\begin{array}{c}\n\\frac{{\\textrm{dw}}_2 }{6}\\\\\n-\\frac{2\\,{\\textrm{dw}}_1 }{5}\n\\end{array}\\right) $$"}}
%---
%[output:9f7d23b5]
%   data: {"dataType":"symbolic","outputData":{"name":"A","value":"$$ \\left(\\begin{array}{cc}\n0 & \\frac{1}{6}\\\\\n-\\frac{2}{5} & 0\n\\end{array}\\right) $$"}}
%---
%[output:992f07d9]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"V","rows":2,"type":"complex","value":[["0.0000 - 0.5423i","0.0000 + 0.5423i"],["0.8402 + 0.0000i","0.8402 + 0.0000i"]]}}
%---
%[output:01962fb7]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"D","rows":2,"type":"complex","value":[["0.0000 + 0.2582i","0.0000 + 0.0000i"],["0.0000 + 0.0000i","0.0000 - 0.2582i"]]}}
%---
%[output:5235fbd6]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"V","rows":2,"type":"complex","value":[["1.0000 + 0.0000i","-1.0000 + 0.0000i"],["0.0000 + 1.5492i","0.0000 + 1.5492i"]]}}
%---
%[output:6860ebf0]
%   data: {"dataType":"matrix","outputData":{"columns":2,"name":"D","rows":2,"type":"complex","value":[["0.0000 + 0.2582i","0.0000 + 0.0000i"],["0.0000 + 0.0000i","0.0000 - 0.2582i"]]}}
%---
