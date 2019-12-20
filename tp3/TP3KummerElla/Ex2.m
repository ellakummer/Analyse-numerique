% ---------------------- partie A ---------------------

% initialisation des vecteurs : 
x = [0,1,2,3,4];
y = [0,1,4,9,16];
z = [0,0,0,0,0];

data = [x;y;z];

xl = linspace(-2,6,100); % bien encadrer les x choisis pour hermite (-2 et +2)
yl = xl.^2;
datal = [xl;yl];

subplot(1,2,1)
hold on
grid on % on veut un cadrillage 
title('Comparaison de Lagrange et Hermite')
axis([-1 5 -1 17]) % sur la figure d'exemple on veut les axes : x de -1 à 5 et y de -1 à 17 
% on veut x allant de 0 à 4 et on va prendre 100 points 
plot(linspace(0,4,100),lagr(datal(2,:).', datal(1,:), linspace(0,4,100)),'red')
plot(linspace(0,4,100),Interpolation_Newton_hermite(linspace(0,4,100),data),'blue')

% on plot les "plateaux" du graphique 
plot(linspace(-0.25,0.25,100),linspace(0,0,100),'black','lineWidth',1.5)
plot(linspace(0.75,1.25,100),linspace(1,1,100),'black','lineWidth',1.5)
plot(linspace(1.75,2.25,100),linspace(4,4,100),'black','lineWidth',1.5)
plot(linspace(2.75,3.25,100),linspace(9,9,100),'black','lineWidth',1.5)
plot(linspace(3.75,4.25,100),linspace(16,16,100),'black','lineWidth',1.5)
xlabel('x')
ylabel('y')
legend('Lagrange','Hermite','location','northwest') % location north west sinon couvre le graphe 
hold off

% ------------------- partie B ------------------------------

x = [0,1,2,3,4];
y = [0,1,4,9,16];
z = [0,NaN,0,NaN,0]; % on met des dérivées inconnues : la différence se voit dans la fonction Interpolation_Newton_Hermite 
data = [x;y;z];

xl = linspace(-2,6,100);
yl = xl.^2;
datal = [xl;yl];

subplot(1,2,2)
hold on
grid on
title('Comparaison de Lagrange et Hermite avec une derivee inconnue')
axis([-1 5 -1 17])
plot(linspace(0,4,100),lagr(datal(2,:).', datal(1,:), linspace(0,4,100)),'red')
plot(linspace(0,4,100),Interpolation_Newton_hermite(linspace(0,4,100),data),'blue')


plot(linspace(-0.25,0.25,100),linspace(0,0,100),'black','lineWidth',1.5)
plot(linspace(0.75,1.25,100),linspace(1,1,100),'black','lineWidth',1.5)
plot(linspace(1.75,2.25,100),linspace(4,4,100),'black','lineWidth',1.5)
plot(linspace(3.75,4.25,100),linspace(16,16,100),'black','lineWidth',1.5)
xlabel('x')
ylabel('y')

legend('Lagrange','Hermite','location','northwest')
hold off

