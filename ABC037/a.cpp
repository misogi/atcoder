#include <iostream>
#include <vector>
using namespace std;

int main() {
  int a, b, mo;
  cin >> a >> b >> mo;
  int num;

  if (a < b) {
    num = mo / a;
  } else {
    num = mo / b;
  }

  cout << num << endl;

  return 0;
}
