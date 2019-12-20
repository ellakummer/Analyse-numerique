function Tn = trap(f,a,b,n) 
% le f doit être passé de cette forme : f = @(x) x^2
% on pourra alors récupérer f(variable)
h = (b-a)/n;
x = linspace(a,b,n+1); % on prend n intervales entre a et b 
% on veut aller de i = 2 à n-1, donc supprimer les suivants de la somme du
% résultat : 
last = x(n+1);
lastlast = x(n);
first = x(1);

%formule du trapèze
Tn = ((1/2)*h*(f(a)+f(b))) + (h * (sum(f(x))))- (h * f(first)) - (h * f(last)) ;
end
