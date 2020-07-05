function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa
  % continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  % citesc din fisier pe N si liniile cu link-urile
  file = fopen(nume);
  % aici il citesc pe N
  N = dlmread(file, ' ', [0 0 0 0]);
  % aici citesc liniile cu link-urile
  A = dlmread(file, ' ', [0 1 N - 1 N + 1]);
  [row col] = size(A);
  fclose(file);
  % Aici compun matricea de adiacenta
  adjacent_matrix = zeros(N);
  for i = 1 : N
   for j = 2 : col
    if A(i, j) != 0
      adjacent_matrix(i, A(i, j)) = 1;
    end
   end
  end
  % Acum initializez vectorul R (PageRank care corespunde
  % timpului t - conform resursei de pe internet ce ne-a fost
  % trimisa)
  R = zeros(N, 1);
  R(:, 1) = 1 / N;
  % R1 este vectorul R (PageRank), dar la timpul t + 1
  R1 = R;
  % Aici am implementat algoritmul descris pe resursa de internet
  while 1
    for i = 1 : N
      suma = 0;
      for j = 1 : N
        if j != i
          % Aici fac suma 
          if(adjacent_matrix(j, i) == 1)
              M = A(j, 1);
              if(adjacent_matrix(j, j) == 1)
                M = A(j, 1) - 1;
              end
              suma = suma + R(j, 1) / M;
          end  
        end
      end
      % Aici calculez R la timpul t + 1, adica R1
      R1(i) = (1 - d) / N + d * suma; 
    end
    % Aici verific conditia de oprire
    if abs(R1(:, 1) - R(:, 1)) < eps
      break;
    end
    % Continuarea iteratiei
    R = R1;
  end
endfunction