% Borcea Rares Ioan, 314CC

function cerinta2()
  % Functie care realizeaza grafice aplicand SVD / SVD redusa
  % S-au selectat imaginile 1 si 3 si k = [1:19]
  
  % citirea imaginilor si obtinerea dimensiunilor matricelor corespunzatoare
  image1 = 'in/images/image1.gif';
  image2 = 'in/images/image3.gif';
  A1 = imread(image1);
  A1 = double(A1); 
  A2 = imread(image2);
  A2 = double(A2); 
  [m1 n1] = size(A1);
  [m2 n2] = size(A2);
  
  % reprezentarea grafica a valorilor singulare pentru cele 2 imagini
  [U S V] = svd(A1);
  x = diag(S);
  figure(1)
  subplot(2,2,1)
  plot(x)
  xlabel('Numarul de valori singulare utilizate', 'FontSize', 10);
  chr = ['Eroarea intre compresie si' "\n" 'imaginea originala'];
  ylabel(chr, 'FontSize', 10);
  grid on;
  
  [U S V] = svd(A2);
  x = diag(S);
  figure(2)
  subplot(2,2,1)
  plot(x)
  xlabel('Numarul de valori singulare utilizate', 'FontSize', 10);
  chr = ['Eroarea intre compresie si' "\n" 'imaginea originala'];
  ylabel(chr, 'FontSize', 10);
  grid on;
  
  % reprezentarea grafica a informatiei date de primele k valori singulare
  % pentru cele 2 imagini
  info1 = zeros(1, 19);
  info2 = zeros(1, 19);
  [U1 S1 V1] = svd(A1);
  [U2 S2 V2] = svd(A2);
  d1 = diag(S1);
  d2 = diag(S2);
  for k = 1:19
    numarator1 = sum(d1(1:k));
    numitor1 = sum(d1(1:min(m1, n1)));
    numarator2 = sum(d2(1:k));
    numitor2 = sum(d2(1:min(m2, n2)));
    info1(k) = numarator1 / numitor1;
    info2(k) = numarator2 / numitor2;
  endfor
  k = [1:1:19];
  figure(1)
  subplot(2,2,2)
  plot(k, info1)
  xlabel('Valoarea k', 'FontSize', 12);
  ylabel('Informatia', 'FontSize', 12);
  grid on;
  
  figure(2)
  subplot(2,2,2)
  plot(k, info2)
  xlabel('Valoarea k', 'FontSize', 12);
  ylabel('Informatia', 'FontSize', 12);
  grid on;
  
  
  % reprezentarea grafica a erorii aproximarii pentru cele 2 imagini
  eroare1 = zeros(1, 19);
  eroare2 = zeros(1, 19);
  for k = 1:19
    Ak1 = cerinta1(image1, k);
    Ak2 = cerinta1(image2, k);
    numarator1 = 0;
    numarator2 = 0;
    
    for i = 1:m1
      suma = 0;
      for j = 1:n1
        suma = suma + (A1(i, j) - Ak1(i, j))^2;
      endfor
      numarator1 = numarator1 + suma;
    endfor
    
    for i = 1:m2
      suma = 0;
      for j = 1:n2
        suma = suma + (A2(i, j) - Ak2(i, j))^2;
      endfor
      numarator2 = numarator2 + suma;
    endfor
    
    eroare1(k) = numarator1 / (m1 * n1);
    eroare2(k) = numarator2 / (m2 * n2);
  endfor
  k = [1:1:19];
  figure(1)
  subplot(2,2,3)
  plot(k, eroare1)
  xlabel('Valoarea k', 'FontSize', 12);
  ylabel('Eroarea aproximarii', 'FontSize', 12);
  grid on;
  
  figure(2)
  subplot(2,2,3)
  plot(k, eroare2)
  xlabel('Valoarea k', 'FontSize', 12);
  ylabel('Eroarea aproximarii', 'FontSize', 12);
  grid on;
  
  % reprezentarea grafica a ratei de compresie pentru cele 2 imagini
  rata1 = zeros(1, 19);
  rata2 = zeros(1, 19);
  for k = 1:19
    rata1(k) = (m1 * k + n1 * k + k) / (m1 * n1);
    rata2(k) = (m2 * k + n2 * k + k) / (m2 * n2);
  endfor
  k = [1:1:19];
  figure(1)
  subplot(2,2,4)
  plot(k, rata1)
  xlabel('Valoarea k', 'FontSize', 12);
  ylabel('Rata de compresie', 'FontSize', 12);
  grid on;
  
  figure(2)
  subplot(2,2,4)
  plot(k, rata2)
  xlabel('Valoarea k', 'FontSize', 12);
  ylabel('Rata de compresie', 'FontSize', 12);
  grid on;
endfunction