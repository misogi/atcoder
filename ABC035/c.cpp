#include <iostream>
#include <vector>

using namespace std;
int main() {
  int n, q;
  cin >> n >> q;

  vector<short> o(n);
  for (int i=0; i<q; i++) {
    int st, ed;
    cin >> st >> ed;
    for (int j=st-1; j<ed; j++) {
      if (o[j] == 0) {
        o[j] = 1;
      } else {
        o[j] = 0;
      }
    }
  }

  for (auto el : o) {
    cout << el;
  }

  cout << endl;

  return 0;
}
