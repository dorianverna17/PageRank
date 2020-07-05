Verna Dorian-Alexandru
Grupa 314CC

Tema consta in fisierele date in arhiva.
Implementarile le-am facut in Iterative.m,
Algebraic.m, PR_Inv.m, Apartenenta.m si PageRank.m.

Fiecare functie este insotita de explicatii date in
comentarii.
De asemenea, am lasat in fiecare ceea ce era scris
la inceputul lor.

Voi explica sumar ce am facut la fiecare task:

1) Task1 - In Iterative.m am aplicat in principiu
algoritmul descris in resursa de internet. Desi
parea mai simplu sa folosesc relatia cu matrice
pentru iteratie, am decis ca pentru inceput sa nu ma
complic si sa folosesc prima formula descrisa, cea
in care calculez pe rand fiecare element din vectorul R,
apoi continui iteratia.

2) Task2 - In Algebraic.m m-am folosit si de functia
ajutatoare PR_Inv.m, unde am calculat inversa matricei
cu ajutorul algoritmului Gram-Schimdt modificat. Dupa
ce am realizat factorizarea QR, am rezolvat, asa cum
este descris si in pdf-ul de la tema, un sistem superior
triunghiular pentru fiecare coloana din matricea A (eu
trebuind sa obtin A^(-1)), coloanele care reprezentau
solutia sistemului fiind, pe rand, coloanele matricei Q'
(Q transpus). La functia Algebraic m-am folosit, spre
deosebire de task-ul 1 de formula cu matrice descrisa
pe resursa de internet, deoarece realizarea matricei M
pe baza matricei K parea un proces mai usor.

3) Task3 - Aici am implementat functiile Apartenenta.m
si PageRank.m, functii care pe baza functiilor anterioare
si pe baza indicatiilor date in pdf realizeaza vectorul
gradelor de apartenenta. Pentru sortare am decis sa
implementez bubblesort. Am facut acest lucru deoarece
uitasem ca exista o functie predefinita in Octave ("sort")
care imi poate sorta vectorul, dar dupa ce am aflat am
decis totusi sa raman pe varianta cu bubblesort, deoarece
o implementasem deja. Singurul aspect care mi se parea
putin ciudat era reprezentat de faptul ca la sortare nu
imi punea in ordinea data ca exemplu in pdf paginile care
aveau acelasi grad de apartenenta, dar ulterior am citit pe
forum si am inteles ca este ok si ca nu este gresit nici cum
imi da mie, fiind si multi altii in aceasta situatie.

De notat este ca pentru functia PR_Inv am implementat
Gram-Schmidt modificat pe baza pseudocodului din laborator.

Rezolvarea sistemului superior triunghiular a fost implementata
pentru a fi aplicata pentru toate coloanele unei matrice.

Per total, tema a fost ok, consider ca am avut de invatat
din ea. Aspectele prezentate despre paginile de internet si
despre ce este in spatele unui motor de cautare chiar au
reprezentat ceva nou pentru mine.
Nu am intampinat dificultati, tema a fost accesibila, iar ca
timp am lucrat aproape doua zile, cu pauzele de rigoare.

Felicitari pentru tema si multumesc!

Verna Dorian-Alexandru
314CC