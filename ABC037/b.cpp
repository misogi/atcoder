#include <iostream>
#include <vector>
using namespace std;

int main() {
  int n, q;
  cin >> n >> q;
  vector<int> aa(n);

  for (int i=0;i<q;i++) {
    int l, r, t;
    cin >> l >> r >> t;
    for (int j=l-1;j<r;j++) {
      aa[j] = t;
    }
  }

  for (auto a : aa) {
    cout << a << endl;
  }
  return 0;
}
