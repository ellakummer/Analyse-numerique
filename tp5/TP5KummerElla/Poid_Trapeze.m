function w = Poid_Trapeze(a,b,n)

% on caclule les poids avec la formule du trapèze : 
delta = (b-a)/n;
w = zeros(1,n+1);
w(1) = delta/2;
w(n+1) = delta/2;
for i = 2:n
    w(i) = delta;
end