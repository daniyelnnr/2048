# 2048

Esse é um jogo casual que tem como objetivo combinar peças contendo valores mútiplos de 2 para alcançar o valor 2048. O projeto foi voltado para a a disciplina de Aplicações de Paradigmas de Linguagens de Programação, da Universidade Federal de Campina Grande.

## Objetivo
O desenvolvimento do jogo 2048 teve como finalidade aplicar de forma prática os conceitos vistos na disciplina teórica de Paradigmas de Linguages de Programção. De maneira geral, os tópicos principais da disciplina foram:
- Paradigma Imperativo
- Paradigma Funcional
- Paradigma Lógico
- Paradigma Concorrente

O projeto foi concebido de modo a exercitar esses conceitos, por meio de linguagens de programação de cada um dos paradigmas acima. O escopo do projeto não incluiu o paradigma concorrente.

## Estrutura

As linguagens utilizadas foram pré-definidas pelos professores. De maneira geral, a opção por elas foi feita por corresponder a linguagem mais popular, em cada um dos paradigmas. E o mesmo jogo foi implementado de três formas diferentes. Foram elas:
- [**C++**](./c++/ ) (*Imperativo*)
- [**Haskell**](./haskell/) (*Funcional*)
- [**Prolog**](./prolog/) (*Lógico*)

## Entendendo o Jogo

Consiste de um jogo de tabuleiro individual, cujo objetivo é movimentar as peças e obter uma célula com o valor de 2048. O tabuleiro é composto por células que são adicionadas aleatóriamente após cada movimentação e o valor dessa peça será 2 ou 4.
> A probabilidade de surgir uma célula com valor 2 é de 90%, enquanto com o valor 4 é de 10%.

A movimentação é feita através das setas ou das teclas ASDW, indicando direita, esquerda, cima ou baixo. Isso resulta no deslocamento de todas as peças para a direção do movimento, quando for possível movê-la. A mudança de posição dessas peças pode resultar na combinação de células e isso ocorre quando elas possuem valores iguais. Como consequência, uma nova célula é produzida com o valor correspondente a soma das células que foram combinadas. Para entender melhor, a imagem abaixo exemplifica o que acontece.
<p align="center">
	<img src="https://articles-images.sftcdn.net/wp-content/uploads/sites/9/2014/03/Corner-Test.gif" title="Exemplo de movimentação">
</p>

## Demo

O [link](https://gabrielecirulli.github.io/2048/ "link") a seguir é uma versão online (não implementada por nós) do mesmo jogo.
