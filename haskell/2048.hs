import Text.Printf

type Grid = [[Int]]

start :: IO Grid
start = do
	let grid = replicate 4 [0, 0, 0, 0]
	return grid

printGrid :: Grid -> IO ()
printGrid grid = do
    mapM_ (putStrLn . concatMap (printf "%5d|")) grid


startText:: IO()
startText = do
	putStrLn "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" 
	putStrLn " 222222222222222         000000000            444444444       888888888" 
	putStrLn "2:::::::::::::::22     00:::::::::00         4::::::::4     88:::::::::88" 
	putStrLn "2::::::222222:::::2  00:::::::::::::00      4:::::::::4   88:::::::::::::88" 
	putStrLn "2222222     2:::::2 0:::::::000:::::::0    4::::44::::4  8::::::88888::::::8" 
	putStrLn "            2:::::2 0::::::0   0::::::0   4::::4 4::::4  8:::::8     8:::::8" 
	putStrLn "            2:::::2 0:::::0     0:::::0  4::::4  4::::4  8:::::8     8:::::8" 
	putStrLn "         2222::::2  0:::::0     0:::::0 4::::4   4::::4   8:::::88888:::::8" 
	putStrLn "    22222::::::22   0:::::0 000 0:::::04::::444444::::444  8:::::::::::::8" 
	putStrLn "  22::::::::222     0:::::0 000 0:::::04::::::::::::::::4 8:::::88888:::::8" 
	putStrLn " 2:::::22222        0:::::0     0:::::04444444444:::::4448:::::8     8:::::8" 
	putStrLn "2:::::2             0:::::0     0:::::0          4::::4  8:::::8     8:::::8" 
	putStrLn "2:::::2             0::::::0   0::::::0          4::::4  8:::::8     8:::::8" 
	putStrLn "2:::::2       2222220:::::::000:::::::0          4::::4  8::::::88888::::::8" 
	putStrLn "2::::::2222222:::::2 00:::::::::::::00         44::::::44 88:::::::::::::88" 
	putStrLn "2::::::::::::::::::2   00:::::::::00           4::::::::4   88:::::::::88" 
	putStrLn "22222222222222222222     000000000             4444444444     888888888" 
	putStrLn "" 
	putStrLn "                            Bem vindo ao jogo 2048!" 
	putStrLn ""
	putStrLn "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" 
	putStrLn "                              Produzido por                                  " 
	putStrLn "Daniyel Rocha | Igor Matheus | Lucas Cavalcanti | Marcos Cesar | Matheus Maia" 
	putStrLn "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" 
	putStrLn "" 
	putStrLn "Seu papel vai ser juntar as pecas deslocando-as para as 4 direcoes basicas"
	putStrLn "de maneira a somar os numeros iguais ate alcancar o valor de 2048" 
	putStrLn "" 
	putStrLn "Você perde o jogo se o tabuleiro estiver com todas ascasas preenchidas" 
	putStrLn "sem que nenhum deles seja o 2048." 
	putStrLn ""
	putStrLn "Temos 4 direcoes possiveis, direita, esquerda, cima e baixo" 
	putStrLn "" 
	putStrLn "As teclas correspondentes sao 'd', 'a', 'w', 's', respectivamente " 
	putStrLn "" 
	putStrLn "Boa sorte" 
	putStrLn "" 
	putStrLn "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++" 
	putStrLn "" 


main :: IO ()
main = do
	startText
	grid <- start
	printGrid grid
	
