:- use_module(library(random)).

telaInicial() :-
    write( "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"),nl,
    write( " 222222222222222         000000000            444444444       888888888"      ),nl,
    write( "2:::::::::::::::22     00:::::::::00         4::::::::4     88:::::::::88"    ),nl,
    write( "2::::::222222:::::2  00:::::::::::::00      4:::::::::4   88:::::::::::::88"  ),nl,
    write( "2222222     2:::::2 0:::::::000:::::::0    4::::44::::4  8::::::88888::::::8" ),nl,
    write( "            2:::::2 0::::::0   0::::::0   4::::4 4::::4  8:::::8     8:::::8" ),nl,
    write( "            2:::::2 0:::::0     0:::::0  4::::4  4::::4  8:::::8     8:::::8" ),nl,
    write( "         2222::::2  0:::::0     0:::::0 4::::4   4::::4   8:::::88888:::::8"  ),nl,
    write( "    22222::::::22   0:::::0 000 0:::::04::::444444::::444  8:::::::::::::8"   ),nl,
    write( "  22::::::::222     0:::::0 000 0:::::04::::::::::::::::4 8:::::88888:::::8"  ),nl,
    write( " 2:::::22222        0:::::0     0:::::04444444444:::::4448:::::8     8:::::8" ),nl,
    write( "2:::::2             0:::::0     0:::::0          4::::4  8:::::8     8:::::8" ),nl,
    write( "2:::::2             0::::::0   0::::::0          4::::4  8:::::8     8:::::8" ),nl,
    write( "2:::::2       2222220:::::::000:::::::0          4::::4  8::::::88888::::::8" ),nl,
    write( "2::::::2222222:::::2 00:::::::::::::00         44::::::44 88:::::::::::::88"  ),nl,
    write( "2::::::::::::::::::2   00:::::::::00           4::::::::4   88:::::::::88"    ),nl,
    write( "22222222222222222222     000000000             4444444444     888888888"      ),nl,
    write( ""                                                                             ),nl,
    write( "                            Bem vindo ao jogo 2048!"                          ),nl,
    write( ""                                                                             ),nl,
    write( "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"),nl,
    write( "                              Produzido por                                  "),nl,
    write( "Daniyel Rocha | Igor Matheus | Lucas Cavalcanti | Marcos Cesar | Matheus Maia"),nl,
    write( "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"),nl,
    write( ""                                                                             ),nl,
    write( "Seu papel vai ser juntar as pecas deslocando-as para as 4 direcoes basicas"   ),nl,
    write( "de maneira a somar os numeros iguais ate alcancar o valor de 2048."           ),nl,
    write( ""                                                                             ),nl,
    write( "Voce perde o jogo se o tabuleiro estiver com todas ascasas preenchidas"       ),nl,
    write( "sem que nenhum deles seja o 2048."                                            ),nl,
    write( ""                                                                             ),nl,
    write( "Temos 4 direcoes possiveis, direita, esquerda, cima e baixo."                 ),nl,
    write( ""                                                                             ),nl,
    write( "As teclas correspondentes sao 'd', 'a', 'w', 's', respectivamente."           ),nl,
    write( ""                                                                             ),nl,
    write( "Boa sorte!"                                                                   ),nl,
    write( ""                                                                             ),nl,
    write( "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"),nl,
    write( ""                                                                             ),nl.

print_matrix([]).
print_matrix([H|T]) :- 
    format('~w ~w ~w ~w~n', H),
    print_matrix(T).

start(G) :-
    G = [
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0]
    ].

adicionaIniciais(G,Grid) :- 
    random_member(Val,[2,2,2,2,2,2,2,2,2,4]),
    /*substituir Val em uma posicao aleatoria de G*/
    length(G, Size),
    list_index(Size,Indexes),
    random_member(X,Indexes),
    random_member(Y,Indexes),
    replace(G,X,Y,Val,Ans),
    Grid = Ans.

replace([H|Tail],0,Y,Z,[R|Tail]) :-
    /*encontrou a linha desejada, agora procura pela coluna*/
    /*lista de listas, entao H e R sao ambas listas*/ 
    replace_column(H,Y,Z,R).
replace([H|Tail],X,Y,Z,[H|R]) :-
    /*recursivamente ate encontrara a linha desejada*/
    X > 0,
    X1 is X-1,
    replace(Tail,X1,Y,Z,R).

replace_column([_|Tail],0,Z,[Z|Tail]).
/*a cabeca sera substituida, formando a resposta*/
replace_column([C|Tail],Y,Z,[C|R]) :-
    /*recursivamente ate encontrara a coluna desejada*/
    Y > 0,
    Y1 is Y-1,
    replace_column(Tail,Y1,Z,R).

/*gera uma lista dos indices da lista, iniciando com 0*/
list_index(0, []) :- !.
list_index(M, [M1|Ks]) :-
    M1 is M - 1,
    list_index(M1, Ks).

:- initialization(main).
main:-
    telaInicial(),
    start(G),
    adicionaIniciais(G,Aux),
    adicionaIniciais(Aux,Grid),
    print_matrix(Grid),nl.