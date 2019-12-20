function Sn = simpeq(f,a,b,n)
h = (b-a)/n;
x = linspace(a,b,n+1);

Sn = (trap(f,a,b,n) + (2 * mid(f,a,b,n)))/3;

end