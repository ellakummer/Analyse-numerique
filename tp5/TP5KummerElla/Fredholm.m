function x = Fredholm(f, K,a,b,n, w  )

A = zeros(n+1,n+1); % on initialise la matrice pour stocker A - A d�finit comme dans l'�nonc�
F = zeros(n+1,1); % on fait de m�me pour F

t = linspace(a,b, n+1); % on d�finit t comme dans l'�nonc�

for i = 0:n
   for j = 0:n
       A(i+1,j+1) = K(t(i+1),t(j+1)) * w(j+1); % construit la matrice A
   end
   F(i+1,1) = f(t(i+1)); % on construit F
end

A = eye(n+1,n+1) - A; % on applique la premi�re op�ration matricielle
x1 = A \ F; % on r�sout le syst�me lin�aire
x = @(s) sum(w.*(K(s*ones(1,n+1),t)).*x1')+ f(s); % on d�finit x(s) selon la formule (3)
end

