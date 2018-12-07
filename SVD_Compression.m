% Borcea Rares Ioan, 314CC

function A_k = cerinta1(image, k)
  % Functie care realizeaza compresia unei imagini folosind descompunerea redusa
  % a valorilor singulare
  
  % citirea imaginii si aplicarea SVD
  A = imread(image);
  A = double(A);
  [U S V] = svd(A);
  
  % obtinerea matricelor din descompunerea redusa
  U_k = U(:, [1:k]);
  S_k = S([1:k], [1:k]);
  V = V';
  V_k = V([1:k], :);
  
  % calcularea matricei imaginii comprimate
  A_k = U_k * S_k * V_k;
endfunction