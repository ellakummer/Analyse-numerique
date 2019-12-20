function w = Poid_Simpson( a,b,n )

% on applique la formule du poid :
h = (b-a)/n;
w = zeros(1,n+1);
for i = 2:2:n
    w(i) = 4*h/3;
end
for j = 3:2:n
    w(j) = 2*h/3;
end
w(1) = h/3;
w(n+1) = h/3;

end

