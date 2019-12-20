function Mn = mid(f,a,b,n)
h = (b-a)/n;
x = linspace(a,b,n+1);
x2 = zeros(1,length(x)-1); % initialise celui ou on va mettre xi + xi+1 / 2 
for k = [1:length(x2)];
    x2(k) = x(k) + x(k+1);
end
x2 = x2/2;

Mn = h * sum(f(x2));

end