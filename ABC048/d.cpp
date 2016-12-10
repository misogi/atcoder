#include <iostream>
#include <vector>
using namespace std;

int main() {
  string str;
  cin >> str;
  int size = (int)str.size();
  int max = size - 2;
  int save = str[0];

  int distance = 0, hand=0;
  for(int i = 1; i < size; ++i){
      char ch = str[i];
      if (ch == save) {
        hand += distance - 1;
        // cout << hand << endl;
        distance = 0;
      } else if(i == (size-1)) {
        hand += distance;
      } else { 
        distance++;
      }
  }

  int w = hand % 2;
  string winner;
  winner = (w==1) ? "First" : "Second";
  cout << winner << endl;

  return 0;
}