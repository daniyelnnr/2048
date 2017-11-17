#include <iostream>
#include <iomanip>
#include <cstdlib>

using namespace std;

int board[4][4] = { 0 };
int score = 0;

bool hasSpaceRight(int row, int col, int i){
	//se ainda tem espa�o na direita e ele est� vazio
	if ((col + i <= 3) && (board[row][col+i] == 0)){
		return true;
	} else {
		return false;
	}
}

bool hasSpaceLeft(int row, int col, int i){
	if ((col - i >= 0) && (board[row][col-i] == 0)){
		return true;
	} else {
		return false;
	}
}

bool hasSpaceUp(int row, int col, int i) {
    if ((row - i >= 0) && (board[row-i][col] == 0)) {
        return true;
    } else {
        return false;
    }
}

bool hasSpaceDown(int row, int col, int i) {
    if ((row + i <= 3) && board[row+i][col] == 0) {
        return true;
    } else {
        return false;
    }

}


void spawn_random() {
	int row, col, s;
	int j = 0;

	//int empty_spaces = rand() % 16; //0 a 15, pra preencher os 16 espaços. mas queremos só 2
	int empty_spaces = 1;

	while (j <= empty_spaces) {
		row = rand() % 4;
		col = rand() % 4;
		s = rand() % 100;
		if (board[row][col] == 0) {
			if (s > 90) {
				board[row][col] = 4;
			} else {
				board[row][col] = 2;
			}
		}
		j++;
	}
}

void movement_generateRandom() {
	int row, col, s;
	row = rand() % 4;
	col = rand() % 4;
	s = rand() % 100;

	if (board[row][col] == 0) {
		if (s > 90) {
			board[row][col] = 4;
		} else {
			board[row][col] = 2;
		}
	} else {
		movement_generateRandom();
	}
}

void buildRow(int row) {
	for (int col = 0; col < 4; col++) {
		if ((board[row][col]) != 0) {
			cout << setw(4) << board[row][col];
		} else {
			cout << setw(4) << " ";
		}
		cout << " | ";
	}
}

void final_score(){
	int final_score = score*10;
	cout << "SCORE: " << final_score << endl;

}

void buildBoard() {
	final_score();
	for (int row = 0; row < 4; row++) {
		cout << "+------+------+------+------+" << endl << "| ";
		buildRow(row);
		cout << endl;
	}
	cout << "+------+------+------+------+" << endl << endl;
	cout << "(W)Up (S)Down (A)Left (D)Right " << endl;
}


bool isHoriEmpty(int row){
	bool empty = true;
	for(int col = 0; col < 4; col ++){
		if(board[row][col] != 0){
			empty = false;
		}
	}
	return empty;
}

bool isVertEmpty(int col){
	bool empty = true;
	for(int row = 0; row < 4; row ++){
		if(board[row][col] != 0){
			empty = false;
		}
	}
	return empty;
}

void shiftRowLeft(int row) {//int col
    //verificar antes se ta tudo zero, senao vai dar null pointer TEM QUE FAZER
	if (!isHoriEmpty(row)) {
		for(int count = 0; count <= 2; count ++){
			for(int col = 0; col <= 2; col ++){
				if(board[row][col] == 0){
					board[row][col] = board[row][col+1];
					board[row][col+1] = 0;
				}
			}
		}
	}
}

void shiftColUp(int col) {//int col
    //verificar antes se ta tudo zero, senao vai dar null pointer TEM QUE FAZER
	if (!isVertEmpty(col)) {
		for(int count = 0; count <= 2; count ++){
			for(int row = 0;row <= 2; row ++){
				if(board[row][col] == 0){
					board[row][col] = board[row+1][col];
					board[row+1][col] = 0;
				}
			}
		}
	}
}

void shiftColDown(int col) {//int col
    //verificar antes se ta tudo zero, senao vai dar null pointer TEM QUE FAZER
	if (!isVertEmpty(col)) {
		for(int count = 0; count <= 2; count ++){
			for(int row = 3;row >= 1; row --){
				if(board[row][col] == 0){
					board[row][col] = board[row-1][col];
					board[row-1][col] = 0;
				}
			}
		}
	}
}

void shiftRowRight(int row) {//int col
	//verificar antes se ta tudo zero, senao vai dar null pointer TEM QUE FAZER
    if (!isHoriEmpty(row)) {
		for(int count = 0; count <= 2; count ++){
			for(int col = 3; col >= 1; col --){
				if(board[row][col] == 0){
					board[row][col] = board[row][col-1];
					board[row][col-1] = 0;
				}
			}
		}
	}
}

bool sumRowLeft(int row){
	bool sum = false;
	for(int col = 0; col < 3; col ++){
		if (board[row][col + 1] == board[row][col]) {
			board[row][col] = 2 * board[row][col];
			board[row][col+1] = 0;
			sum = true;
			score += board[row][col];
		}
	}
	return sum;
}

bool sumRowRight(int row){
	bool sum = false;
	for(int col = 3; col > 0; col --){
		if (board[row][col - 1] == board[row][col]) {
			board[row][col] = 2 * board[row][col];
			board[row][col-1] = 0;
			sum = true;
			score += board[row][col];
		}
	}
	return sum;
}

bool sumColUp(int col){
	bool sum = false;
	for(int row = 0; row < 3; row++){
		if (board[row+1][col] == board[row][col]) {
			board[row][col] = 2 * board[row][col];
			board[row+1][col] = 0;
			sum = true;
			score += board[row][col];
		}
	}
	return sum;
}

bool sumColDown(int col){
	bool sum = false;
	for(int row = 3; row > 0; row --){
		if (board[row-1][col] == board[row][col]) {
			board[row][col] = 2 * board[row][col];
			board[row-1][col] = 0;
			sum = true;
			score += board[row][col];
		}
	}
	return sum;
}

bool check_left(){
	bool move = false;
	for(int row = 0; row <= 3; row ++){
		for(int col = 0; col <= 2; col ++){
			if(board[row][col] == 0 && board[row][col+1] != 0){
				move = true;
			}if((board[row][col] == board[row][col+1]) && (board[row][col] != 0)){
				move = true;
			}
		}
	}
	return move;
}

bool check_right(){
	bool move = false;
	for(int row = 0; row <= 3; row ++){
		for(int col = 3; col >= 1; col --){
			if(board[row][col] == 0 && board[row][col-1] != 0){
				move = true;
			}if((board[row][col] == board[row][col-1]) && (board[row][col] != 0)){
				move = true;
			}
		}
	}
	return move;
}

bool check_down(){
	bool move = false;
	for(int col = 0; col <= 3; col ++){
		for(int row = 3; row >= 1; row --){
			if((board[row][col] == 0) && (board[row-1][col] != 0)){
				move = true;
			}if((board[row][col] == board[row-1][col]) && (board[row-1][col] != 0)){
				move = true;
			}
		}
	}
	return move;
}

bool check_up(){
	bool move = false;
	for(int col = 0; col <= 3; col ++){
		for(int row = 0; row <= 2; row ++){
			if((board[row][col] == 0) && (board[row+1][col] != 0)){
				move = true;
			}if((board[row][col] == board[row+1][col]) && (board[row][col] != 0)){
				move = true;
			}
		}
	}
	return move;
}

void left_movement() {
	if(check_left()){
		for (int row = 0; row < 4; row++) {
			shiftRowLeft(row);
			if(sumRowLeft(row)){
				shiftRowLeft(row);
			}
		}
		movement_generateRandom();

	}
	
}

void right_movement() {
	if(check_right()){
		for (int row = 0; row < 4; row++) {
		shiftRowRight(row);
			if(sumRowRight(row)){
				shiftRowRight(row);
			}
		}
		movement_generateRandom();
	}

}

void up_movement() {
	bool var = check_up();
	if(var){
		for (int col = 0; col < 4; col++) {
			shiftColUp(col);
			if(sumColUp(col)){
				shiftColUp(col);
			}
		}
		movement_generateRandom();
	}
}

void down_movement() {
	if(check_down()){
		for (int col = 0; col < 4; col++) {
			shiftColDown(col);
			if(sumColDown(col)){
				shiftColDown(col);
			}
		}
		movement_generateRandom();
	}
}



void userInput() {
	char input;
	cout << "Entrada: ";
	cin >> input;
	cout << endl;
	switch (toupper(input)) {
	case 'W':
		up_movement();
		break;
	case 'A':
		left_movement();
		break;
	case 'S':
		down_movement();
		break;
	case 'D':
		right_movement();
		break;
	case 'Q':
		cout << "Perdeu!! ";
		exit(0);
	default:
		cout << "Entrada incorreta! " << endl;
		userInput();
		break;
	}
	if(!check_down() && !check_left() && !check_right() && !check_up()){
		buildBoard();
		cout << endl;
		cout << "Perdeu!! " << endl;
		exit(0);
	}
}

void gameStart(){
	cout << "++++++++++++++++++++++++++++++++++++++++++++++++++++" << endl;
	cout << "" << endl;
	cout << "Bem vindo ao jogo 2048!" << endl;
	cout << "" << endl;
	cout << "Seu papel vai ser juntar as pecas deslocando-as para as 4 direcoes basicas" << endl;
	cout << "de maneira a somar os numeros iguais ate alcancar o valor de 2048" << endl;
	cout << "" << endl;
	cout << "Você perde o jogo se o tabuleiro estiver com todas ascasas preenchidas" << endl;
	cout << "sem que nenhum deles seja o 2048." << endl;
	cout << "" << endl;
	cout << "Temos 4 direcoes possiveis, direita, esquerda, cima e baixo" << endl;
	cout << "" << endl;
	cout << "As teclas correspondentes sao 'd', 'a', 'w', 's', respectivamente " << endl;
	cout << "" << endl;
	cout << "Boa sorte" << endl;
	cout << "" << endl;
	cout << "++++++++++++++++++++++++++++++++++++++++++++++++++++" << endl;
	cout << "" << endl;

}

bool checkWin() {
	for(int row = 0; row < 4; row++) {
		for(int col = 0; col < 4; col++) {
			if(board[row][col] == 2048) {
				return true;
			}
		}
	} 
	return false;
}

void playGame() {
	gameStart();
	spawn_random();
	while (true) {
		buildBoard();
		userInput();
		if(checkWin()){
			buildBoard();
			cout << endl << "GANHOU O JOGO!! " << endl;
			break;
		}
	}
}

int main() {
	srand((unsigned int) time(0)); // seed for random generator
	playGame();
	return 0;
}
