#include <iostream>
#include <vector>
using namespace std;

int main() {
  int a,b,c;
  cin >> a >> b >> c;

  int ans;
  if (a == b && b == c) {
    ans = 1;
  } else if(a==b || b==c ||a==c) {
    ans = 2;
  } else {
    ans = 3;
  }

    cout << ans << endl;


  return 0;
}
