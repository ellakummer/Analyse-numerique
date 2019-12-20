% ------------------- POUR POINTS EQUIDISTANTS --------------------------

x = linspace(-1, 1, 100);
erreurf1 = [];
erreurf2 = [];
differenceBaryf1=[];
differenceBaryf2 = [];
differencelagrangef1 = [];
differencelagrangef2 = [];
plagrangef1 = [];
plagrangef2 = [];
polyf1 = sin(linspace(-1, 1, 100));
polyf2 = [1:100];
for q = [1:100];
    polyf2(q) = 1/(1+(x(q) * x(q)));
end
for n = [3:14] ;
    % on va construire les n+1 points équidistants 
    xequi = []
    for j = [0 : n];
        xequi(j+1) = ((2/n)*j) - 1 ;
    end

    % f1 = sin(x)
    % f2 = 1/(1+x^2)
    yf1 = []; % contiendra la fonction sin(x) aux points équivalents 
    yf2 = [];
    for k = [0 : n ];
        yf1(k+1) = sin(xequi(k+1));
        yf2(k+1) = 1/(1 + (xequi(k+1))^2) ; 
    end 

    % on va utiliser l'interpolation barycentriqe pour ces couples de f1 et f2, sur 100 x entre -1 et 1  :
    for k = [1:100];
        pbaryf1(k) = langrangeInterpolationBarycentrique(x(k), [xequi ; yf1]);
        pbaryf2(k) = langrangeInterpolationBarycentrique(x(k), [xequi ; yf2]);
    end
    differenceBaryf1(end+1) = max(abs(pbaryf1-polyf1));
    differenceBaryf2(end+1) = max(abs(pbaryf2-polyf2));
        
    % on refait pour lagrange :
    plagrangef1 = lagr(yf1.', xequi, x);
    plagrangef2 = lagr(yf2.', xequi, x);
    differencelagrangef1(end+1) = max(abs(plagrangef1-polyf1));
    differencelagrangef2(end+1) = max(abs(plagrangef2-polyf2));

    %erreurs d'interpolation : 
    syms xxx
    f = sin(xxx);
    ff = 1 /(1+xxx^2);
    z = linspace(-1, 1, 100);
    g = diff(f,n+1);
    gg = diff(ff, n+1);
    maxsin = abs(vpa(subs(g,z(1))));
	maxf = abs(vpa(subs(gg,z(1))));
    for k = [2: length(z)];   
        if maxsin < abs(vpa(subs(g,z(k)))) ;
            maxsin = abs(vpa(subs(g,z(k))));
        end
        if maxf < abs(vpa(subs(gg,z(k)))) ;
            maxf = abs(vpa(subs(gg,z(k))));
        end
    end
    erreurf1(end+1) =   maxsin * (1 / (4 * (n + 1))) * ((2/n)^(n+1)); % max de sin ou cos = 1 entre -1 et 1 
    erreurf2(end+1) =  maxf * (1 / (4 * (n + 1))) * ((2/n)^(n+1)); % S'OCCUPER DES DERIVEES !! 
   
end

subplot(2,2,1)
hold on
grid on
plot([3,4,5,6,7,8,9,10,11,12,13,14],erreurf1,'black')
scatter([3,4,5,6,7,8,9,10,11,12,13,14],differenceBaryf1,'blue','LineWidth',1.5)
scatter([3,4,5,6,7,8,9,10,11,12,13,14],differencelagrangef1,'red','*')
set(gca,'yscale','log');
ylim([10^(-16) 10^0]);
xlim([3,14])
title('Erreur pour points equidistants : sin(x)')
legend('b(n)','Barycentrique','Lagrange')
xlabel('n')
ylabel('max |pn(x) - f(x)|')
hold off

subplot(2,2,2)
hold on
grid on
plot([3,4,5,6,7,8,9,10,11,12,13,14],erreurf2,'black')
scatter([3,4,5,6,7,8,9,10,11,12,13,14],differenceBaryf2,'blue','LineWidth',1.5)
scatter([3,4,5,6,7,8,9,10,11,12,13,14],differencelagrangef2,'red','*')
set(gca,'yscale','log');
ylim([10^(-16) 10^0]);
xlim([3,14])
title('Erreur pour points equidistants : 1/1+x^2')
legend('b(n)','Barycentrique','Lagrange')
xlabel('n')
ylabel('max |pn(x) - f(x)|')
hold off


    
% ------------------- POUR POINTS CHEBYSHEV  --------------------------
xx = linspace(-1, 1, 200);
erreurf12 = [];
erreurf22 = [];
differenceBaryf12=[];
differenceBaryf22 = [];
differencelagrangef12 = [];
differencelagrangef22 = [];
plagrangef12 = [];
plagrangef22 = [];
polyf12 = sin(linspace(-1, 1, 200));
polyf22 = [1:200];
for q = [1:200];
    polyf22(q) = 1/(1+(xx(q) * xx(q)));
end
for n = [3:15] ;
    % on va construire les n+1 points équidistants 
    xcheby = [];
    for j = [1 : n+1];
        xcheby(j) = cos(pi*(((2*(j-1))+1)/((2*n)+2)));
    end
    
    yf12 = [] % contiendra la fonction sin(x) aux points équivalents 
    yf22 = []
    for k = [0 : n ];
        yf12(k+1) = sin(xcheby(k+1));
        yf22(k+1) = 1/(1 + (xcheby(k+1))^2) ; 
    end 

    % on va utiliser l'interpolation barycentriqe pour ces couples de f1 et f2, sur 200 x entre -1 et 1  :
    for k = [1:200];
        pbaryf12(k) = langrangeInterpolationBarycentrique(xx(k), [xcheby ; yf12]);
        pbaryf22(k) = langrangeInterpolationBarycentrique(xx(k), [xcheby ; yf22]);
    end
    differenceBaryf12(end+1) = max(abs(pbaryf12-polyf12));
    differenceBaryf22(end+1) = max(abs(pbaryf22-polyf22));
        
    % on refait pour lagrange :
    plagrangef12 = lagr(yf12.', xcheby, xx);
    plagrangef22 = lagr(yf22.', xcheby, xx);
    differencelagrangef12(end+1) = max(abs(plagrangef12-polyf12));
    differencelagrangef22(end+1) = max(abs(plagrangef22-polyf22));

    erreurf12(end+1) =  (2^(n+1)) * maxsin / ((2^((2*n)+1)) * (factorial(n+1))); % max de sin ou cos = 1 entre -1 et 1 
    %erreurf22(end+1) =  (2^(n+1)) * maxf / ((2^((2*n)+1)) * (factorial(n+1))); % S'OCCUPER DES DERIVEES !!
   erreurf22(end+1) = borneTcheb(n);
end

subplot(2,2,3)
hold on
grid on
plot([3,4,5,6,7,8,9,10,11,12,13,14,15],erreurf12,'black')
scatter([3,4,5,6,7,8,9,10,11,12,13,14,15],differenceBaryf12,'blue','LineWidth',1.5)
scatter([3,4,5,6,7,8,9,10,11,12,13,14,15],differencelagrangef12,'red','*')
set(gca,'yscale','log');
ylim([10^(-16) 10^0]);
xlim([3,14])
title('Erreur pour points chebyshev : sin(x)')
legend('b(n)','Barycentrique','Lagrange')
xlabel('n')
ylabel('max |pn(x) - f(x)|')
hold off

subplot(2,2,4)
hold on
grid on
plot([3,4,5,6,7,8,9,10,11,12,13,14,15],erreurf22,'black')
scatter([3,4,5,6,7,8,9,10,11,12,13,14,15],differenceBaryf22,'blue','LineWidth',1.5)
scatter([3,4,5,6,7,8,9,10,11,12,13,14,15],differencelagrangef22,'red','*')
set(gca,'yscale','log');
ylim([10^(-14) 10^0]);
xlim([3,16])
title('Erreur pour points chebyshev : 1/1+x^2')
legend('b(n)','Barycentrique','Lagrange')
xlabel('n')
ylabel('max |pn(x) - f(x)|')
hold off
