#include <iostream>
#include <iomanip>
#include <cstdlib>

using namespace std;

//int board[4][4] = {
//{1,2,3,4},
//{5,6,7,8},
//{9,10,11,12},
//{13,14,15,16}
//};

int board[4][4] = { 0 };

bool hasSpaceRight(int row, int col, int i){
	//se ainda tem espaço na direita e ele está vazio
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

bool hasSpaceUp(int row, int col) {
    if ((row - 2 >= 0) && (board[row-2] == 0)) {
        return true;
    } else {
        return false;
    }
}

bool hasSpaceDown(int row, int col) {
    if ((row + 2 <= 3) && board[row+2] == 0) {
        return true;
    } else {
        return false;
    }

}


void spawn_random() {
	int row, col, s;
	int j = 0;

	//int empty_spaces = rand() % 16; //0 a 15, pra preencher os 16 espaÃ§os. mas queremos sÃ³ 2
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

void movment_generateRandom() {
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
		movment_generateRandom();
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

void buildBoard() {

	for (int row = 0; row < 4; row++) {
		cout << "+------+------+------+------+" << endl << "| ";
		buildRow(row);
		cout << endl;
	}
	cout << "+------+------+------+------+" << endl << endl;
	cout << "(W)Up (S)Down (A)Left (D)Right ";
}

void up_movment() {
	for (int row = 3; row > 0; row--) {
		for (int col = 3; col >= 0; col--) {
			if (row - 1 >= 0) {
				if (board[row][col] != 0) {
					if (board[row - 1][col] == board[row][col]) {
						board[row - 1][col] = 2 * board[row][col];
						board[row][col] = 0;
					} else {
						if (board[row - 1][col] == 0) {
                            board[row - 1][col] = board[row][col];
                            board[row][col] = 0;
                        } else if (hasSpaceUp(row, col)) {
                            board[row-2][col] = board[row-1][col];
                            board[row-1][col] = board[row][col];
                            board[row][col] = 0;
                        }

					}
				}
			}
		}
	}
	movment_generateRandom();
}

void down_movment() {
	for (int row = 0; row < 4; row++) {
		for (int col = 0; col < 4; col++) {
			if (row + 1 <= 3) {
				if (board[row][col] != 0) {
					if (board[row + 1][col] == board[row][col]) {
						board[row + 1][col] = 2 * board[row][col];
						board[row][col] = 0;
					} else {
						if (board[row + 1][col] == 0) {
                            board[row + 1][col] = board[row][col];
                            board[row][col] = 0;
                        } else if (hasSpaceDown(row, col)) {
                            board[row+2][col] = board[row+1][col];
                            board[row+1][col] = board[row][col];
                            board[row][col] = 0;
                        }
					}
				}
			}
		}
	}
	movment_generateRandom();
}

void left_movment() {
	for (int row = 3; row >= 0; row--) {
		for (int col = 3; col > 0; col--) {
			if (col - 1 >= 0) {
				//se o valor da direita é igual, soma
				if (board[row][col] != 0) {
					if (board[row][col - 1] == board[row][col]) {
						board[row][col - 1] = 2 * board[row][col];
						board[row][col] = 0;
					//se são diferentes...
					} else {
						//se o valor da esquerda é zero, basta substituir
                        if (board[row][col - 1] == 0) {
                            board[row][col - 1] = board[row][col];
                            board[row][col] = 0;
                        }
                        //se o valor da esquerda não é zero, o bloco precisa ser deslocado à esquerda
                        else{
                        	//se tem espaço 2 colunas à esquerda. Ex: col = 3 e a linha é 0 0 4 2
                        	if (hasSpaceLeft(row, col, 2)){
                        		board[row][col-2] = board[row][col-1];
                        		board[row][col-1] = board[row][col];
                        		board[row][col] = 0;
                        	}
                        	//se tem espaço 3 colunas à esquerda. Ex: col = 3 e a linha é 0 8 4 2
                        	else if (hasSpaceLeft(row, col, 3)){
                        		board[row][col-3] = board[row][col-2];
                        		board[row][col-2] = board[row][col-1];
                        		board[row][col-1] = board[row][col];
                        		board[row][col] = 0;
                        	}
                        }
					}
				}
			}
		}
	}
	movment_generateRandom();
}

void right_movment() {
	for (int row = 0; row < 4; row++) {
		for (int col = 0; col < 4; col++) {
			if (col + 1 <= 3) {
				if (board[row][col] != 0) {
					//se o valor da direita é igual, soma
					if (board[row][col + 1] == board[row][col]) {
						board[row][col + 1] = 2 * board[row][col];
						board[row][col] = 0;
					//se são difentes...
					} else {
						//se o valor da direita é zero, basta substituir
						if (board[row][col+1] == 0){
							board[row][col + 1] = board[row][col];
							board[row][col] = 0;
						//se o valor da direita não for zero, o bloco precisa ser deslocado para a direita
						} else {
							//se tem espaço 2 colunas à frente. Ex: col = 0 e a linha é 2 4 0 0
							if (hasSpaceRight(row, col, 2)){
								board[row][col+2] = board[row][col+1];
								board[row][col+1] = board[row][col];
								board[row][col] = 0;
							}
							//se tem espaço 3 colunas à frente. Ex: col = 0 e a linha é 2 8 4 0
							else if (hasSpaceRight(row, col, 3)){
								board[row][col+3] = board[row][col+2];
								board[row][col+2] = board[row][col+1];
								board[row][col+1] = board[row][col];
								board[row][col] = 0;
							}
						}
					}
				}
			}
		}
	}
	movment_generateRandom();
}

void userInput() {
	char input;
	cin >> input;
	switch (toupper(input)) {
	case 'W':
		cout << "cima"; // acao mover cima
		up_movment();
		break;
	case 'A':
		cout << "esq"; // acao mover esq
		left_movment();
		break;
	case 'S':
		cout << "down"; // acao mover baixo
		down_movment();
		break;
	case 'D':
		cout << "dir"; // acao mover dir
		right_movment();
		break;
	case 'Q':
		exit(0);
	default:
		cout << "Entrada incorreta! " << endl;
		userInput();
		break;
	}
}
void playGame() {
	spawn_random();
	while (true) {
		buildBoard();
		userInput();
	}
}

int main() {
	srand((unsigned int) time(0)); // seed for random generator
	playGame();
	return 0;
}
