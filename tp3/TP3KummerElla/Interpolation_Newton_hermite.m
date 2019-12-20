function P_n = Interpolation_Newton_hermite(x,data) %calcul de p_n(x) grace a la methode de newton

xx=data(1,:); % on récupère les x
y=data(2,:); % on récupère les y
z=data(3,:); % on récupère les z
x2 = [];
y2 = [];
z2 = [];
for i = 1:length(xx) % on va tout doubler pour avoir [x0,x0,x1,x1,...,xn,xn]
    if isnan(z(i)) % on vérifie si la dérivée est donnée (POINT B EXO 2) 
        x2(end+1) = xx(i);
        y2(end+1) = y(i);
        z2(end+1) = z(i);
    else
        x2(end+1) = xx(i);
        x2(end+1) = xx(i);
        y2(end+1) = y(i);
        y2(end+1) = y(i);
        z2(end+1) = z(i);
        z2(end+1) = z(i);
    end
end
x2;
y2;
z2;
data2 = [x2;y2;z2];

c = differences_divisees_hermite(data2); % on calcule les differences divisees
P_n=zeros(1,length(x)); % on initie le vecteur de la longueur des composantes initiales 
reccx = 1;

for j=1:length(x) % on va évaluer sur tous les x passés en paramètre (sous forme de vecteur x)
    reccx = 1;
    for k=1:length(c) % on va de c0 à cn (coeffs diff. divisées obtenus) pour calculer tous les coefficients 
        % on construit le polynome par récurrence 
        P_n(j)=P_n(j)+c(k)*reccx; % on ajoute au polynome le ck*(x-xo)...(x-xk-1)
        reccx = reccx*(x(j)-data2(1,k)); % aussi par récurrence : * (x-xk) pour le suivant 
    end
end
end