xx = linspace(-1, 1, 200);
erreurf12 = [];
pbrayf12 = [];
pbaryf22 = [];
differenceBaryf12=[];
differenceBaryf22 = [];
polyf12 = abs(linspace(-1, 1, 200));
polyf22 = [1:200];
for q = [1:200];
    polyf22(q) = (abs(sin(5.*xx(q)))).^3;
end
for n = [3:100] ;
    % on va construire les n+1 points équidistants 
    xcheby = []
    for j = [0 : n];
        xcheby(j+1) = cos(pi*(((2*j)+1)/((2*n)+2)));
    end
    
    yf12 = [];
    yf22 = [];
    for k = [0 : n ];
        yf12(k+1) = abs(xcheby(k+1));
        yf22(k+1) = (abs(sin(5.*xcheby(k+1)))).^3; 
    end 

    % on va utiliser l'interpolation barycentriqe pour ces couples de f1 et f2, sur 100 x entre -1 et 1  :
    for k = [1:200];
        pbaryf12(k) = langrangeInterpolationBarycentrique(xx(k), [xcheby ; yf12]);
        pbaryf22(k) = langrangeInterpolationBarycentrique(xx(k), [xcheby ; yf22]);
    end
    differenceBaryf12(end+1) = max(abs(pbaryf12-polyf12));
    differenceBaryf22(end+1) = max(abs(pbaryf22-polyf22));
end
    
puissance1=[1:1:n];
puissance1=puissance1.^(-1);
puissance2=[1:1:n];
puissance2=puissance2.^(-3);

%loglog : Create a plot using a logarithmic scale for both the x-axis and the y-axis. Use a line with square markers. Display the grid.
subplot(1,2,1)
hold on
grid on
scatter([1:98],differenceBaryf12,'*','red')
loglog([1:100],puissance1,'color','blue','LineWidth',1.1)
set(gca,'yscale','log');
set(gca,'xscale','log');
ylim([10^(-3) 10^0]);
xlim([10^0,10^2])
title('Erreur d''interpolation pour f_2')
legend('Erreur','n^{-1}')
xlabel('n')
ylabel('max |pn(x) - f(x)|')
hold off

subplot(1,2,2)
hold on
grid on
scatter([1:98],differenceBaryf22,'*','red')
loglog([1:100],puissance2,'color','blue','LineWidth',1.1)
set(gca,'yscale','log');
set(gca,'xscale','log');
ylim([10^(-6) 10^1]);
xlim([10^0,10^2])
title('Erreur d''interpolation pour f_1')
legend('Erreur','n^{-3}')
xlabel('n')
ylabel('max |pn(x) - f(x)|')
hold off
