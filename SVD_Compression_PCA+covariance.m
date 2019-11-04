function [Ak S] = cerinta4(image, k)
  % Functie care realizeaza compresia unei imagini utilizand componentele principale
  % si matricea de covarianta
  
  % citirea imaginii si obtinerea dimensiunii matricei corespunzatoare
  A = imread(image);
  A = double(A);
  [m n] = size(A);
  
  % obtinerea vectorului U, a matricei Z conform algoritmului
  u = zeros(m, 1);
  for i = 1:m
    u(i) = (sum(A(i, :)))/n;
    A(i, :) = A(i, :) - u(i);
  endfor
  Z = zeros(m, m);
  Z = (A * A') ./ (n - 1);
  
  % obtinerea valorilor si vectorilor proprii pentru matricea Z
  [V S] = eig(Z);
  [S, index] = sort(diag(S),'descend');
  V = V(:, index);
  
  % obtinerea matricei componentelor principale
  W = zeros(m, k);
  W = V(:, [1:k]);
  
  % calculul proiectiei lui A in spatiul c. principale si obtinerea matricei aproximate
  Y = W' * A;
  Ak = W * Y + u;
endfunction
