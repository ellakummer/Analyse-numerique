function valp=lagr(valf,x,t)
% �valuation en t du polyn�me de
% Lagrange de f aux abscisses x.
% x doit �tre colonne
A=fliplr(vander(x));
p=A\valf;
valp=polyval(flipud(p),t);
