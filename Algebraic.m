function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica
  % de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la
  % o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  % Deschid fisierul pentru citire
  file = fopen(nume);
  % citesc numarul de link-uri
  N = dlmread(file, ' ', [0 0 0 0]);
  % aici citesc liniile cu link-urile
  A = dlmread(file, ' ', [0 1 N - 1 N + 1]);
  [row col] = size(A);
  fclose(file);
  % Aici compun matricea de adiacenta
  % si matricea M
  adjacent_matrix = zeros(N);
  M = zeros(N);
  for i = 1 : N
    for j = 2 : col
      if A(i, j) != 0
        adjacent_matrix(i, A(i, j)) = 1; 
      end
    end
  end
  for i = 1 : N
    adjacent_matrix(i, i) = 0;
  end
  % Asa cum spune si in documentatia data, K este matricea
  % diagonala cu numarul link-urilor spre care merge un site
  u = A(:, 1);
  % u reprezinta vectorul ce contine numarul de link-uri spre
  % care poate merge un site
  % in cele ce urmeaza voi forma acest vector
  for i = 1 : N
    for j = 2 : col
      % in cazul in care un site contine un link catre el insusi
      % atunci scad un 1 din el
      if A(i, j) == i
        u(i) = u(i) - 1;
      end
    end
  end
  % pe baza vectorului u formez matricea K
  u = u';
  K = diag(u);
  % aici calculez matricea M
  M = ((K^(-1))*adjacent_matrix)';
  % Acum initializez vectorul R (PageRank)
  R = zeros(N, 1);
  % Compun matricea identitate
  v = ones(1, N);
  I = diag(v);
  % Aici e formula pentru R
  R = PR_Inv(I - d * M) * (1 - d) / N * ones(N, 1);
endfunction