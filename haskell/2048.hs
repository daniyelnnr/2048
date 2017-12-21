import Text.Printf
import System.IO
import System.Random
import Data.List

type Grid = [[Int]]

start :: IO Grid
start = do
    let grid = replicate 4 [0, 0, 0, 0]
    return grid

printGrid :: Grid -> IO ()
printGrid grid = do
    putStrLn ""
    putStrLn "+----+-----+-----+-----+"
    mapM_ (putStrLn . concatMap (printf "%5d|")) grid
    putStrLn "+----+-----+-----+-----+"
    putStrLn "(W)Up (S)Down (A)Left (D)Right"

eTuplaZero :: Grid -> [(Int, Int)]
eTuplaZero grid = filter (\(row, col) -> (grid!!row)!!col == 0) coordenadas
    where linha n = zip (replicate 4 n) [0..3]
          coordenadas = concatMap linha [0..3]

concatena :: Grid -> (Int, Int) -> Int -> Grid
concatena grid (row, col) val = pre ++ [mid] ++ post
    where pre  = take row grid
          mid  = take col (grid!!row) ++ [val] ++ drop (col + 1) (grid!!row)
          post = drop (row + 1) grid

adicionaIniciais :: Grid -> IO Grid
adicionaIniciais grid = do
    let tuplasPossiveis = eTuplaZero grid
    escolhido <- escolhaAleatoria tuplasPossiveis
    num  <- escolhaAleatoria [2,2,2,2,2,2,2,2,2,4]
    let grid' = concatena grid escolhido num
    return grid'

escolhaAleatoria :: [a] -> IO a
escolhaAleatoria xs = do
    index <- randomRIO (0, length xs-1)
    return (xs !! index)

--movimenta e combina (so pra esquerda, por enquanto)
combina :: [Int] -> [Int]
combina xs = combinada ++ resto
    where resto = replicate (length xs - length combinada) 0
          combinada  = merge (filter (/= 0) xs)
          merge (x:y:xs) | x == y = (x*2):(merge xs)
                         | otherwise = x:(merge (y:xs))
          merge x = x

mover :: String -> Grid -> Grid
mover "a" = map combina
mover "d" = map (reverse . combina . reverse)
mover "w" = transpose . mover "a" . transpose
mover "s" = transpose . mover "d" . transpose



--loop do jogo
playGame :: Grid -> IO ()
playGame grid = do
    printGrid grid
    mov <- getLine
    let grid' = mover mov grid
    if (grid /= grid') then do
        novo_gride <- adicionaIniciais grid'
        playGame novo_gride
    else do
    grid2 <- adicionaIniciais grid
    playGame grid2

   
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
    gridAux <- adicionaIniciais grid
    grid' <- adicionaIniciais gridAux
    --inicia com dois valores aleatorios
    playGame grid'
