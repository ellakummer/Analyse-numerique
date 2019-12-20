%% TP5 - Exercice 4 
%% a) 
clear 
% On commence à définir f et K comme indiqué dans l'énoncé :
f = @(s) (25 - 16*sin(s).^2);
K = @(s,t) -1/pi * (0.3./(1-0.64*cos((s+t)./2).^2));

% on va effectuer les calculs pour n =2,6 et 10 : 
% n= 2

subplot(1,3,1)

w = Poid_Simpson(-pi,pi,2); % on calcule le poid 
x = Fredholm(f,K,-pi,pi,2,w); % on résout l'equation
hold on
X = linspace(-pi,pi,100); % on initialise l'intervalle de valeurs 

plot(X, 17/2 + 128/17 * cos(2*X),'LineWidth',1.3,'color','blue') % on trace la solution exacte
plot(X, arrayfun(x,X),'--','LineWidth',1.3,'color','red'); % on evalue la fonction avec arrayfun et on trace
axis([-3,3,-2,18])
title('n = 2')
ylabel('x(s)')
xlabel('s')
legend('exact','numeric')
hold off

% n = 6
subplot(1,3,2)

w = Poid_Simpson(-pi,pi,6);
x = Fredholm(f,K,-pi,pi,6,w);
hold on
X = linspace(-pi,pi,100);

plot(X, 17/2 + 128/17 * cos(2*X),'LineWidth',1.3,'color','blue')
plot(X, arrayfun(x,X),'--','LineWidth',1.3,'color','red');
axis([-3,3,-2,18])
title('n = 6')
ylabel('x(s)')
xlabel('s')
legend('exact','numeric')
hold off

% n = 10
subplot(1,3,3)

w = Poid_Simpson(-pi,pi,10);
x = Fredholm(f,K,-pi,pi,10,w);
hold on
X = linspace(-pi,pi,100);

plot(X, 17/2 + 128/17 * cos(2*X),'LineWidth',1.3,'color','blue')
plot(X, arrayfun(x,X),'--','LineWidth',1.3,'color','red');
axis([-3,3,-2,18])
title('n = 10')
ylabel('x(s)')
xlabel('s')
legend('exact','numeric')
hold off

%% b) 
figure
K2 = @(s,t) abs(s-t);
f2 = @(s) -(2*s^3 - 9*s +2)/6;
% n= 2
subplot(1,3,1)

w = Poid_Simpson(0,1,2);
x = Fredholm(f2,K2,0,1,2,w);
hold on
X = linspace(0,1,100);

plot(X, X,'LineWidth',1.3,'color','blue')
plot(X, arrayfun(x,X),'--','LineWidth',1.3,'color','red');
title('n = 2')
ylabel('x(s)')
xlabel('s')
legend('exact','numeric')
hold off

% n = 6
subplot(1,3,2)

w = Poid_Simpson(0,1,6);
x = Fredholm(f2,K2,0,1,6,w);
hold on
X = linspace(0,1,100);

plot(X, X,'LineWidth',1.3,'color','blue')
plot(X, arrayfun(x,X),'--','LineWidth',1.3,'color','red')
title('n = 6')
ylabel('x(s)')
xlabel('s')
legend('exact','numeric')
hold off

% n = 10
subplot(1,3,3)

w = Poid_Simpson(0,1,10);
x = Fredholm(f2,K2,0,1,10,w);
hold on
X = linspace(0,1,100);

plot(X, X,'LineWidth',1.3,'color','blue')
plot(X, arrayfun(x,X),'--','LineWidth',1.3,'color','red')
title('n = 10')
ylabel('x(s)')
xlabel('s')
legend('exact','numeric')
hold off
%% c)

X = linspace(-pi,pi,7);
X2 = linspace(0,1,700);

% on va calculer l'erreur entre la courbe calculée x^(s) et la courbe
% exacte x(s). On commence pour l'équation (a) : 
erreur1 = [];
for n = 2:2:52 % on varie le nombre de points
    w = Poid_Simpson(-pi,pi,n); % on calcule le poid pour chaque n
    x = Fredholm(f,K,-pi,pi,n,w); % on calcule x^(s): 
    erreur1(end+1) = max(abs(arrayfun(x,X) - (17/2 + 128/17 * cos(2*X)) )); % on calcule l'erreur
end 

% On fait de même pour l'équation (b)
erreur2 = [];
for n = 2:2:52
    w = Poid_Simpson(0,1,n);
    x = Fredholm(f2,K2,0,1,n,w);
    erreur2(end+1) = max(abs(arrayfun(x,X2) - X2 ));
end 

figure
subplot(1,2,1)
hold on
plot([2:2:52],erreur1,'+r') % on trace l'erreur pour (a)
plot([2:2:52],erreur2,'ob') % idem pour (b)
set(gca, 'YScale', 'log')
axis([0 52 10^-15 10])
title('Erreur en fonction de n pour les poids de Simpson')
ylabel('erreur')
xlabel('n')
legend('equation(a)','equation(b)')
hold off

%% d)

X = linspace(-pi,pi,15);
X2 = linspace(0,1,7);
erreur1 = [];
for n = 2:2:52
    w = Poid_Trapeze(-pi,pi,n);
    x = Fredholm(f,K,-pi,pi,n,w);
    erreur1(end+1) = max(abs(arrayfun(x,X) - (17/2 + 128/17 * cos(2*X)) ));
end 
erreur2 = [];
for n = 2:2:52
    w = Poid_Trapeze(0,1,n);
    x = Fredholm(f2,K2,0,1,n,w);
    erreur2(end+1) = max(abs(arrayfun(x,X2) - X2 ));
end 

subplot(1,2,2)
hold on
plot([2:2:52],erreur1,'+r')
plot([2:2:52],erreur2,'ob')
set(gca, 'YScale', 'log')
axis([0 52 10^-15 10])
title('Erreur en fonction de n pour les poids de Trapeze')
ylabel('erreur')
xlabel('n')
legend('equation(a)','equation(b)')
hold off
