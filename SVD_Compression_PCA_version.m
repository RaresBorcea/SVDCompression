% Borcea Rares Ioan, 314CC

function [Ak S] = cerinta3(image, k)
  % Functie care realizeaza compresia unei imagini utilizand componentele principale
  
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
  Z = zeros(n, m);
  rad = sqrt(n - 1);
  Z = A' ./ rad;
  
  % aplicarea SVD pe matricea Z, obtinerea matricei componentelor principale
  [U S V] = svd(Z);
  W = zeros(m, k);
  W = V(:, [1:k]);
  
  % calculul proiectiei lui A in spatiul c. principale si obtinerea matricei aproximate
  Y = W' * A;
  Ak = W * Y + u;
endfunction