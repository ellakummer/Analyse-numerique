%Exercice 1
max = 100;
%% Integrale 1
f = @(x)exp(-x.^2);
exact = sqrt(pi)*erf(1);
% Partie a)
erreur = [];
somme = 0;
for s = 3:max
[c,b] = nodes_weights_gauss_general(s,-1,1);
approx = b'*f(c);
erreur = [erreur abs(exact-approx)];
end
loglog(3:max,erreur,'ro')
% Partie b)
erreur2 = [];
for N = 1:100
    approx2 = integrate_composite_Gauss(N,4,-1,1,f);
    erreur2 = [erreur2 abs(exact-approx2)];
end
figure(4)
loglog(1:100,erreur2,'ro');
hold on
loglog(1:100,(1:100).^-8,'k--');
hold off
%--------------------------------------------------------------------------
%% Intergale 2
g = @(x)abs(x);
exact = 13/2;
% Partie a)
erreur = [];
for s = 3:max
[c,b] = nodes_weights_gauss_general(s,-3,2);
approx = sum(g(c).*b);
erreur = [erreur abs(exact-approx)];
end
figure(2)
loglog(3:max,erreur,'bo')
% Partie b)
erreur2 = [];
for N = 1:100
    approx2 = integrate_composite_Gauss(N,4,-3,2,g);
    erreur2 = [erreur2 abs(exact-approx2)];
end
figure(5)
loglog(1:100,erreur2,'bo');
hold on
loglog(1:100,(1:100).^-8,'k--');
hold off
%% Integrale 3
h = @(x)1./(1+25*x.^2);
exact = (2*atan(5))/5;
% Partie a)
erreur = [];
for s = 3:max
[c,b] = nodes_weights_gauss_general(s,-1,1);
approx = sum(h(c).*b);
erreur = [erreur abs(exact-approx)];
end
figure(3)
loglog(3:max,erreur,'go')
% Partie b)
erreur2 = [];
for N = 1:100
    approx2 = integrate_composite_Gauss(N,4,-1,1,h);
    erreur2 = [erreur2 abs(exact-approx2)];
end
figure(6)
loglog(1:100,erreur2,'go');
hold on
loglog(1:100,(1:100).^-8,'k--');
hold off
