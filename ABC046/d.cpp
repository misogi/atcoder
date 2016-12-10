#include <iostream>
#include <vector>
using namespace std;

int main() {
  char c;
  int n = 0, your_par = 0;

  vector<bool> yours;

  while( cin >> c ){
    if (c == 'p') {
      your_par++;
    }
    n++;
  }

  int max_par;
  max_par = n / 2;

  cout << (max_par - your_par) << endl;

  return 0;
}
