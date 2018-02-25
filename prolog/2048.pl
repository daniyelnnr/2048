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

zero_matrix(N, K) :-
    zero_matrix(N, N, K).

zero_matrix(0, _, []).
zero_matrix(N, M, [K|T]) :-
    N1 is N - 1,
    zero_vector(M, K),
    zero_matrix(N1, M, T).

zero_vector(0, []).
zero_vector(M, [0|T]) :-
    M1 is M - 1,
    zero_vector(M1, T).

:- initialization(main).
main:-
    telaInicial(),
    zero_matrix(4,S),
    print_matrix(S),nl.
	