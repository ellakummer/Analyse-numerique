function c = differences_divisees_hermite(data)
x=data(1,:);
y=data(2,:);
z=data(3,:);
n=length(z);
T=0; % on initialise le tableau 

%calcul de c0
for i = 1:n % on replit la premim�re colone avec les y(i) images des x(i)
    T(i,1)=y(i);
end

%on remplit les autres colones, mais que les cases utiles 
for i=2:n % des colones 2 � n = longueur vecteur 
    for j=2:i % chaque fois on ne remplit que celles qui vont servir aux calculs suivant 
        if (x(i)-x(i-j+1))==0 % si le d�nominateur est nul, on sort la d�riv�e (formule vue en cours) 
            T(i,j)=z(i);
        else
            T(i,j)=(T(i,j-1)-T(i-1,j-1))/(x(i)-x(i-j+1)); % sinon on calcule normale, newton
        end
    end
end
%on prend les c qui nous int�ressent : sur la diagonale : 
c=transpose(diag(T));
end
