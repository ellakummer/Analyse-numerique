%% TP5 - Exercice 3
%%
% a)
f=@(x)exp((x.^2).*(1-x).^2); % on d�finit la fonction anonyme periodique

%On initialise les vecteurs dans lesquels on va stocker les resultats
resultats_trapeze = [];
resultats_simpson = [];

for n=2:2:52 %pour differents nombres de noeuds

    somme = 0; % on initialise les diff�rentes sommes
    somme_temp1_simp = 0;
    somme_temp2_simp = 0;
    for i=1:n-1
        somme = somme + f(i*(1/n)); %formule de trapeze
    end
    for j=1:n/2-1
        somme_temp1_simp = somme_temp1_simp + f(2*j/n); %premi�re somme temporaire de simpson
    end
    for j=1:n/2
        somme_temp2_simp = somme_temp2_simp + f((2*j-1)/n); %deuxieme somme temporaire de simpson
    end
    % on calcule l'int�lgrale avec la m�thode du trap�ze
    resultats_trapeze(end+1) = (( f(0)+f(1) )/2+somme)/n;
    % on calcule l'int�grale avec la m�thode de simpson
    resultats_simpson(end+1) = (f(0) + 2*somme_temp1_simp + 4*somme_temp2_simp + f(1))/(3*n);
end

subplot(1,2,1)
int = integral(f,0,1); % on clacule l'int�grale exacte avec matlab
hold on
% on trace l'erreur obtenue en comparant la m�thode de simpson et du
% trap�ze (avec un nombre de noeuds diff�rents) � l'int�grale exacte 
scatter([2:2:52],abs(resultats_trapeze-int),'red','+') 
scatter([2:2:52],abs(resultats_simpson-int),'blue')
set(gca, 'YScale', 'log') % �chelle logarithmique pour l'axe des ordonn�es
axis([0 52 10^-10 10])
legend('trap�ze','simpson')
xlabel('n')
ylabel('absolute error')
title('erreur fonction p�riodique trap�ze/simpson')

% On refait exactement comme avant mais avec l'autre fonction : 
clear all
f=@(x)exp(-x.^2);
resultats_trapeze = [];
resultats_simpson = [];
for n=2:2:52 
    x=linspace(0,1,n);
    somme = 0;
    somme_temp1_simp = 0;
    somme_temp2_simp = 0;
    for i=1:n-1
        somme = somme + f(i*(1/n)); 
    end
    for j=1:n/2-1
        somme_temp1_simp = somme_temp1_simp + f(2*j/n);
    end
    for j=1:n/2
        somme_temp2_simp = somme_temp2_simp + f((2*j-1)/n);
    end
    resultats_trapeze(end+1) = (( f(0)+f(1) )/2+somme)/n;
    resultats_simpson(end+1) = (f(0) + 2*somme_temp1_simp + 4*somme_temp2_simp + f(1))/(3*n);
end

subplot(1,2,2)
int = integral(f,0,1);
hold on
scatter([2:2:52],abs(resultats_trapeze-int),'red','+')
scatter([2:2:52],abs(resultats_simpson-int),'blue')
set(gca, 'YScale', 'log')
axis([0 52 10^-10 10])
legend('trap','simpson')
xlabel('n')
ylabel('absolute error')
title('erreur fonction non-p�riodique trap�ze/simpson')


% b) exemple pour la fonction sin(2*pi*k*x)
figure
hold on
for k = 1:2:60
f=@(x)sin(2*pi*k*x);
resultats_trapeze = [];
for n=1:2:52 %pour differents nombres de noeuds
    resultats_trapeze(end+1) = trap(f,0,1,n);
end
int = integral(f,0,1);
scatter([1:2:52],abs(resultats_trapeze-int))

end
set(gca, 'YScale', 'log')
axis([0 52 10^-19 10^-9])
xlabel('n')
ylabel('absolute error')
title('erreur fonction non-p�rodique trap�ze/simpson')


