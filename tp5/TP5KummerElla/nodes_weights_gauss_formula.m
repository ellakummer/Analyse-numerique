function [c,b] = nodes_weights_gauss_formula( s )
% For a Gauss quadrature formula with s stages (etages) compute
% c are the nodes (les noeuds)
% b are the weights (les poids)

beta = .5./sqrt(1-(2*(1:s-1)).^(-2)); 
A = diag(beta,1) + diag(beta,-1);      
   
[Q,D] = eig(A);

c = diag(D);
b = 2*Q(1,:).^2;
b = b';
