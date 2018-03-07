:- initialization(main).	
menu():-
	printa(),
	read(OP), nl ,
	sw(OP).

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


sw(6):-
	findall(X, (array(X,_,_,_,_)),L),
	direita(L),
	verificaFim(L),
	menu().	
sw(4):-
	findall(X, (array(X,_,_,_,_)),L),
	esquerda(L),
	verificaFim(L),
	menu().	
sw(2):-
	array(0,X,Y,W,Z),
	array(1,X1,Y1,W1,Z1),
	array(2,X2,Y2,W2,Z2),
	array(3,X3,Y3,W3,Z3),
	
	assertz(array(4,X,X1,X2,X3)),
	assertz(array(5,Y,Y1,Y2,Y3)),
	assertz(array(6,W,W1,W2,W3)),
	assertz(array(7,Z,Z1,Z2,Z3)),
	
	shif(4),
	shif(5),
	shif(6),
	shif(7),
	
	somaDireita(4),
	somaDireita(5),
	somaDireita(6),
	somaDireita(7),
		
	array(4,A1,A2,A3,A4),
	array(5,B1,B2,B3,B4),
	array(6,C1,C2,C3,C4),
	array(7,D1,D2,D3,D4),
	

	
	retract(array(0,_,_,_,_)),
	retract(array(1,_,_,_,_)),
	retract(array(2,_,_,_,_)),
	retract(array(3,_,_,_,_)),
	
	assertz(array(0,A1,B1,C1,D1)),
	assertz(array(1,A2,B2,C2,D2)),
	assertz(array(2,A3,B3,C3,D3)),
	assertz(array(3,A4,B4,C4,D4)),
		
	verificaFim([0,1,2,3]),
	
	retract(array(4,_,_,_,_)),
	retract(array(5,_,_,_,_)),
	retract(array(6,_,_,_,_)),
	retract(array(7,_,_,_,_)),
	
	menu().


sw(8):-
	array(0,X,Y,W,Z),
	array(1,X1,Y1,W1,Z1),
	array(2,X2,Y2,W2,Z2),
	array(3,X3,Y3,W3,Z3),
	
	
	assertz(array(4,X,X1,X2,X3)),
	assertz(array(5,Y,Y1,Y2,Y3)),
	assertz(array(6,W,W1,W2,W3)),
	assertz(array(7,Z,Z1,Z2,Z3)),
	
	shif1(4),
	shif1(5),
	shif1(6),
	shif1(7),
		
	somaEsquerda(4),
	somaEsquerda(5),
	somaEsquerda(6),
	somaEsquerda(7),
	
	array(4,A1,A2,A3,A4),
	array(5,B1,B2,B3,B4),
	array(6,C1,C2,C3,C4),
	array(7,D1,D2,D3,D4),
	
	retract(array(0,_,_,_,_)),
	retract(array(1,_,_,_,_)),
	retract(array(2,_,_,_,_)),
	retract(array(3,_,_,_,_)),
	
	assertz(array(0,A1,B1,C1,D1)),
	assertz(array(1,A2,B2,C2,D2)),
	assertz(array(2,A3,B3,C3,D3)),
	assertz(array(3,A4,B4,C4,D4)),
	
	verificaFim([0,1,2,3]),
	
	retract(array(4,_,_,_,_)),
	retract(array(5,_,_,_,_)),
	retract(array(6,_,_,_,_)),
	retract(array(7,_,_,_,_)),
	
	menu().

sw(_):-
	halt(0).

verificaFim([]).
verificaFim([Head|Tail]):-
	write("aqui1"),
	verifica(Head),
	write("aqui2"),
	verificaFim(Tail).


verifica(Numero) :- array(Numero, X,Y,W,Z), (X=2048;Y=2048;W=2048;Z=2048),
	write("aqui"),
	printa(),
	write("FIM DE JOGO"), nl,
	halt(0).
	
verifica(_).	

printa():-
	findall(X, (array(X,_,_,_,_)),L),
	listarArray(L).
esquerda([]).
esquerda([Head|Tail]):-
	shif1(Head),
	somaEsquerda(Head),
	esquerda(Tail).
somaEsquerda(Numero):- W=Z,X=Y,
	array(Numero,X,Y,W,Z),
	SOMA is W + Z,
	SOMA2 is X + Y,
	retract(array(Numero,_,_,_,_)),
	assertz(array(Numero,SOMA2,SOMA,0,0)).

somaEsquerda(Numero):- X=Y,
	array(Numero,X,Y,W,Z),
	SOMA is X + Y,
	retract(array(Numero,_,_,_,_)),
	assertz(array(Numero,SOMA,W,Z,0)).	
	
somaEsquerda(Numero):- W=Y,
	array(Numero,X,Y,W,Z),
	SOMA is W + Y,
	retract(array(Numero,_,_,_,_)),
	assertz(array(Numero,X,SOMA,Z,0)).	



somaEsquerda(Numero):- W=Z,
	array(Numero,X,Y,W,Z),
	SOMA is W + Z,
	retract(array(Numero,_,_,_,_)),
	assertz(array(Numero,X,Y,SOMA,0)).



somaEsquerda(Numero):- 
	array(Numero,X,Y,W,Z),
	retract(array(Numero,_,_,_,_)),
	assertz(array(Numero,X,Y,W,Z)).




direita([]).
direita([Head|Tail]):-
	shif(Head),
	somaDireita(Head),
	direita(Tail).

somaDireita(Numero):- W=Z,X=Y,
	array(Numero,X,Y,W,Z),
	SOMA is W + Z,
	SOMA2 is X + Y,
	retract(array(Numero,_,_,_,_)),
	assertz(array(Numero,0,0,SOMA2,SOMA)).	
somaDireita(Numero):- W=Z,
	array(Numero,X,Y,W,Z),
	SOMA is W + Z,
	retract(array(Numero,_,_,_,_)),
	assertz(array(Numero,0,X,Y,SOMA)).

somaDireita(Numero):- X=Y,
	array(Numero,X,Y,W,Z),
	SOMA is X + Y,
	retract(array(Numero,_,_,_,_)),
	assertz(array(Numero,0,SOMA,W,Z)).
somaDireita(Numero):- W=Y,
	array(Numero,X,Y,W,Z),
	SOMA is W + Y,
	retract(array(Numero,_,_,_,_)),
	assertz(array(Numero,0,X,SOMA,Z)).	

somaDireita(Numero):- 
	array(Numero,X,Y,W,Z),
	retract(array(Numero,_,_,_,_)),
	assertz(array(Numero,X,Y,W,Z)).
		
inicia():-
	assertz(array(0,1024,0,1024,2)),
	assertz(array(1,1024,0,4,4)),
	assertz(array(2,2,2,0,4)),
	assertz(array(3,2,2,4,4)).

listarArray([]).
listarArray([H|Tail]):-
	array(H,X,Y,W,Z),
	write("---------------------"), nl ,
	format('|~w~5+|~w~5+|~w~5+|~w~5+|  ~n', [X,Y,W,Z]),
	listarArray(Tail).
	
/* SHIFT DIREITA */
shif(Numero):- array(Numero,X,Y,W,Z), X \= 0, Y = 0, W = 0, Z=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,0,0,0,X)).
shif(Numero):- array(Numero,X,Y,W,Z), X = 0, Y \= 0, W = 0, Z=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,0,0,0,Y)).
shif(Numero):- array(Numero,X,Y,W,Z), X = 0, Y = 0, W \= 0, Z=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,0,0,0,W)).																				

shif(Numero):- array(Numero,X,Y,W,Z), X \= 0, Y \= 0, W = 0, Z=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,0,0,X,Y)).
shif(Numero):- array(Numero,X,Y,W,Z), X \= 0, Y = 0, W \= 0, Z=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,0,0,X,W)).						
shif(Numero):- array(Numero,X,Y,W,Z), X = 0, Y \= 0, W \= 0, Z=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,0,0,Y,W)).											

shif(Numero):- array(Numero,X,Y,W,Z), X \= 0, Y \= 0, W \= 0, Z=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,0,X,Y,W)).
shif(Numero):- array(Numero,X,Y,W,Z), X \= 0, Y \= 0, W = 0, Z\=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,0,X,Y,Z)).
shif(Numero):- array(Numero,X,Y,W,Z), X \= 0, Y = 0, W \= 0, Z\=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,0,X,W,Z)).										

/* SHIFT ESQUERDA */

shif1(Numero):- array(Numero,X,Y,W,Z), X = 0, Y = 0, W = 0, Z\=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,Z,0,0,0)).
shif1(Numero):- array(Numero,X,Y,W,Z), X = 0, Y \= 0, W = 0, Z=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,Y,0,0,0)).
shif1(Numero):- array(Numero,X,Y,W,Z), X = 0, Y = 0, W \= 0, Z=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,W,0,0,0)).																				

shif1(Numero):- array(Numero,X,Y,W,Z), X = 0, Y \= 0, W \= 0, Z=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,Y,W,0,0)).
shif1(Numero):- array(Numero,X,Y,W,Z), X = 0, Y \= 0, W = 0, Z\=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,Y,Z,0,0)).						
shif1(Numero):- array(Numero,X,Y,W,Z), X = 0, Y = 0, W \= 0, Z\=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,W,Z,0,0)).											

shif1(Numero):- array(Numero,X,Y,W,Z), X = 0, Y \= 0, W \= 0, Z\=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,Y,W,Z,0)).
shif1(Numero):- array(Numero,X,Y,W,Z), X \= 0, Y \= 0, W = 0, Z\=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,X,Y,Z,0)).
shif1(Numero):- array(Numero,X,Y,W,Z), X \= 0, Y = 0, W \= 0, Z\=0, retract(array(Numero,_,_,_,_)),
										assertz(array(Numero,X,W,Z,0)).	

shif1(_).
shif(_).										
main:-
	telaInicial(),
	inicia(),
	menu(),
	
halt(0).
