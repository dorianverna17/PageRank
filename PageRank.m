function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  % deschid fisierul nume pentru citire
  file = fopen(nume, "r");
  % citesc N
  N = dlmread(file, ' ', [0 0 0 0]);
  % citesc valorile val1 si val2 in vectorul
  % val prima valoare din vector este val1,
  % iar a doua este val2
  val = dlmread(file, ' ', [N 0 N + 1 0]);
  % inchid fisierul de la citire
  fclose(file);
  % acum compun numele pentru fisierul de iesire
  nume_out = strcat(nume, ".out");
  % deschid fisierul pentru scriere
  file_out = fopen(nume_out, "w");
  % printez numarul N si vectorii de PageRank-uri
  % calculati la task-urile anterioare
  fprintf(file_out, "%d\n", N);
  fprintf(file_out, "\n");
  R1 = Iterative(nume, d, eps);
  fprintf(file_out, "%f\n", R1);
  fprintf(file_out, "\n");
  R2 = Algebraic(nume, d);
  fprintf(file_out, "%f\n", R2);
  fprintf(file_out, "\n");
  % Acum compun vectorul gradelor de
  % apartenenta
  % folosesc forma functiei date in pdf-ul de la tema
  % apelez functia Apartenenta.m care imi face calculele
  % necesare
  for i = 1 : N
    u(i) = Apartenenta(R2(i), val(1), val(2));
  end
  % Acum fac sortarea - bubblesort
  nr = 0;
  schimb = 0;
  % index este un vector care contine numerele link-urilor in ordinea sortarii
  index = linspace(1, N, N);
  % Am incercat sa folosesc acelasi algoritm de la programare
  % In loc de do...while-ul de acolo, am ales sa folosesc o bucla
  % while aici.
  while schimb == 1 || nr == 0
    schimb = 0;
    for i = 1 : N - 1
      if u(i) < u(i + 1)
        % aici fac swap intre numerele nodurilor si intre
        % gradele lor de apartenenta
        index_aux(i) = index(i);
        index(i) = index(i + 1);
        index(i + 1) = index_aux(i);
        aux = u(i);
        u(i) = u(i + 1);
        u(i + 1) = aux;
        schimb = 1;
      end
    end
    % nr este un auxiliar pentru a sti cand ma aflu la prima
    % iteratie si cand nu
    nr = 1;
  end
  % Aici printez partea cu vectorul sortat
  for i = 1 : N
    fprintf(file_out, "%d %d %f", i, index(i), u(i));
    fprintf(file_out, "\n");
  end
  % afisez clasamentul in functie de 
  % inchid fisierul folosit pentru scriere
  fclose(file_out);
endfunction