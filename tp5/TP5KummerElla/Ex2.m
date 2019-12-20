% PARTIE A                                                                                                                                           % pour l'erreur théorique, comme on est d'ordre 2, on va juste plot(h,h^2)
n = [1:100];

erreur1 = ones(1,length(n));
erreur2 = ones(1,length(n));
erreur12 = ones(1,length(n));
erreur22 = ones(1,length(n));
erreur13 = ones(1,length(n));
erreur23 = ones(1,length(n));

for i = [1:length(n)];
% on va déjà définir les trois intégrales : 

% intégrale 1 : e^-x^2 entre -1 et 1 
f = @(x) exp(-x.^(2));
res1 = trap(f,-1,1,n(i));
res2 = mid(f,-1,1,n(i));

erreur1(i) = abs((((pi^(1/2)) * erf(1))) - res1);
erreur2(i) = abs(((pi^(1/2)) * erf(1)) - res2);

% intégrale 2 : abs(x) entre -3 et 2 

f2 = @(x) abs(x);
res12 = trap(f2,-3,2,n(i));
res22 = mid(f2,-3,2,n(i));

erreur12(i) = abs((13/2) - res12);
erreur22(i) = abs((13/2) - res22);

%intégrale 3 : 1/(1 + 25x^2) entre -1 et 1 

f3 = @(x) (1 ./ (1 + (25 * (x.^2))));
res13 = trap(f3,-1,1,n(i));
res23 = mid(f3,-1,1,n(i));

erreur13(i) = ((2 * atan(5)) / 5) - res13;
erreur23(i) = ((2 * atan(5)) / 5) - res23;

end


h1 = 2./n;
h2 = 5./n;
h3 = 2./n;

hy = h1.^2;

figure
loglog(h1,hy), hold on
loglog(h1,erreur1,'*'), hold on
loglog(h1,erreur2,'s'), hold on
loglog(h2,erreur12,'+'), hold on 
loglog(h2,erreur22,'*'), hold on 
loglog(h2,erreur13,'d'), hold on 
loglog(h2,erreur23,'o'), hold on 
title('Errors of the approximation of the tree integrals using trapezoid and midppoint rules')
legend('erreur theorique','i1 trapezoid','i1 midpoint','i2 trapezoid', 'i2 midpoint', 'i3 trapezoid', 'i3 midpoint')
xlabel('h')
ylabel('error')
hold off

% PARTIE B 
erreurb1 = ones(1,length(n));
erreurb2 = ones(1,length(n));
erreurb3 = ones(1,length(n));

for i = [1:length(n)];
% on va déjà définir les trois intégrales : 

% intégrale 1 : e^-x^2 entre -1 et 1 
f = @(x) exp(-x.^(2));
resb1 = simpeq(f,-1,1,n(i));

erreurb1(i) = abs((((pi^(1/2)) * erf(1))) - resb1);

% intégrale 2 : abs(x) entre -3 et 2 

f2 = @(x) abs(x);
resb2 = simpeq(f2,-3,2,n(i));

erreurb2(i) = abs((13/2) - resb2);

%intégrale 3 : 1/(1 + 25x^2) entre -1 et 1 

f3 = @(x) (1 ./ (1 + (25 * (x.^2))));
resb3 = simpeq(f3,-1,1,n(i));

erreurb3(i) = ((2 * atan(5)) / 5) - resb3;

end

h1 = 2./n;
h2 = 5./n;
h3 = 2./n;

% pour l'erreur théorique 
hy = h1.^2;

figure
loglog(h1,hy), hold on
loglog(h1,erreurb1,'*'), hold on
loglog(h2,erreurb2,'s'), hold on
loglog(h3,erreurb3,'o'), hold on 
title('Errors of the approximation of the tree integrals using simpson rule')
legend('erreur theorique','i1 simpson', 'i2 simpson','i3 simpson')
xlabel('h')
ylabel('error')
hold off


% PARTIE C : 
%approximer intégrale : (Ax^3 + Bx^2 + Cx + D) dx  entre a et b 
%on connait le resultat = 3Ax^2 + 2Bx + C 
erreur = []; 
chgta = [];
for a = [1:5];
    for b = [1:5];
        for c = [1:5];
            for d = [1:5];
                f = @(x) (a*x.^(3))+(b*x.^(2))+(c*x)+ d ;
                fderiv = @(x) (3*a^(2))+(2*b*x)+c;
                exact = fderiv(1); % car on a posé entre 0 et 1 
                avecSimpson = simpeq(f,0,1,100);
                erreur(end+1) = abs(avecSimpson-exact);
            end
        end
    end
    % juste voir ou on change de a 
    chgta(end+1) = length(erreur);
end
figure
plot([1:length(erreur)],erreur)
title('différents A,B,C,D')
ylabel('error')
legend('changements de a en : 125,250,500,625')