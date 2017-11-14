#include <iostream>

using namespace std;

int board[4][4] = {
    {1,2,3,4},
    {5,6,7,8},
    {9,10,11,12},
    {13,14,15,16}
};

/*void showValue(int row_no, int col_no) {
     if (box_values[row_no][col_no] != 0) {  
          printf("%5d", box_values[row_no][col_no]);  
     }else{  
          printf("   ");  
     }  
}  
  
void showRow(int row_no) {  
     for (int col_no = 0; col_no < 4; col_no++)  
     {  
          printf("|");  
          DisplayValue(row_no, col_no);  
     }  
     printf("|\n\n");  
} */

void buildBoard() {
  for (int row = 0; row < 4; row++) { 
    for (int col = 0; col < 4; col++) {
      
    }
  }
}

void DisplayBox(void) {   
     printf("-----------------------------------\n\n");  
     printf("w -> move up\n");  
     printf("a -> move left\n");  
     printf("s -> move down\n");  
     printf("d -> move right\n");  
     printf("x -> exit\n\n");  
  
     for (int row_no = 0; row_no < 4; row_no++)  
     {  
          printf("-------------------------\n\n");  
          DisplayRow(row_no);  
     }  
     printf("-------------------------\n\n");  
}  

int main() {
  cout << "HELLO";
  //int box_values[4][4] = { 0 };
  
  //printf("%5d", box_values[0][0]);

  DisplayBox();
  return 0;
}