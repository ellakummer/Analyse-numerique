function Int_value = integrate_composite_Gauss(N,s,a,b,f)
% Integrate function f on the interval (a,b) with N intervals and degree s
% using the nodes and weights from the function NODES_WEIGHTS_GAUSS_GENERAL
interval = linspace(a,b,N+1);

approx = 0;
for i = 1:N
    [c,b] = nodes_weights_gauss_general(s,interval(i),interval(i+1));
    approx = approx + b'*f(c);
end

Int_value = approx;


