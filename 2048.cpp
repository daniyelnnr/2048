#include <iostream>
#include <iomanip>

using namespace std;

int board[4][4] = {
    {1,2,3,4},
    {5,6,7,8},
    {9,10,11,12},
    {13,14,15,16}
};

void buildBoard() {
  for (int row = 0; row < 4; row++) { 
    cout << "+------+------+------+------+" << endl << "| ";    
    for (int col = 0; col < 4; col++) {
      if (board[row][col] =! 0) {
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

int main() {
  buildBoard();
  return 0;
}