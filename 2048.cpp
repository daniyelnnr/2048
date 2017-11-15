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
	
	int board[4][4] = {0};		

void buildBoard() {
	
  for (int row = 0; row < 4; row++) { 
    cout << "+------+------+------+------+" << endl << "| ";
    for (int col = 0; col < 4; col++) {
      if ((board[row][col]) != 0) {
        cout << setw(4) << board[row][col];
        cout << " | ";
      } else {
        cout << setw(4) << " ";
      }
    }
    cout << endl;
  }
  cout << "+------+------+------+------+" << endl << endl;
}
void randomize(){
  int a,b,s;
  int j = 0;
  
  int vacancies = rand() % 16;
  
  while(j <= vacancies){
    a = rand() % 4; 
    b = rand() % 4;
    s = rand() % 100;
    if(board[a][b] == 0){
      if( s > 60 ){
        board[a][b] = 4;}
      else{ 
	    board[a][b] = 2;}
      }
    j++;
  }
}


int main() {
  
  srand((unsigned int) time(0));
  //buildBoard();
  randomize();
  randomize();
  randomize();
  buildBoard();
  return 0;
}
