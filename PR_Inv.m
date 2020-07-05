function [B] = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare
  % Determin dimensiunea matricei patratice A
  [n n] = size(A);
  % Initializez R si Q
  R = zeros(n); Q = R;
  % Acum implementez algoritmul Gram-Schimdt modificat
  % M-am folosit de pseudocodul din laborator
  for i = 1 : n
    % calculez elementul de pe diagonala lui R
    R(i, i) = norm(A(:, i));
    % calculez elementele de pe coloana i din Q
    Q(:, i) = A(:, i) / R(i, i);
    for j = i + 1 : n
      % calculez celelalte elemente de pe linia i din R
      % care sunt corespunzatoare coloanelor mai mari decat i + 1
      R(i, j) = Q(:, i)' * A(:, j);
      % modific A pentru iteratie
      A(:, j) = A(:, j) - Q(:, i) * R(i, j);
    end
  end
  % formez matricea identitate
  v = ones(1, n);
  I = diag(v);
  % Sistemul va fi Q * R * B = I
  % Q^(-1) = Q', deci R * B = Q' * I = X
  X = Q' * I;
  % de aici, calculele se rezuma la rezolvarea unui SST
  % (sistem superior triunghiular)
  B = zeros(n);
  % iterez prin coloanele matricei B(inversa returnata)
  for k = 1 : n
    % Aici fac rezolvarea unui sistem superior triunghiular
    % Fac asta pentru fiecare coloana a matricei B
    for i = n : -1 : 1
      y = 0;
      % Aici calculez suma produselor elementelor care nu
      % sunt pe diagonala principala cu elementele din B
      % gasite la iteratiile precedente
      for j = i + 1 : n
        y = y + R(i, j) * B(j, k);
      end
      % Aici calculez pe baza lui y(auxiliar), valoarea
      % elementului din B de la iteratia curenta
      B(i, k) = (X(i, k) - y) / R(i, i);
    end
  end
endfunction