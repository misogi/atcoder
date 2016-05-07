#include <iostream>
#include <vector>
using namespace std;

int main() {
  int n, k;
  cin >> n >> k;
  vector<int> aa(n);
  long ans = 0;

  for (int i=0; i<n; i++) {
    cin >> aa[i];
  }

  for (int i=0; i<k; i++) {
    ans += aa[i];
  }

  long memo = ans;
  for (int i=1;i<=n-k;i++) {
    int end;
    end = i + k - 1;
    memo += aa[end];
    memo -= aa[i-1];
    ans += memo;
  }

  cout << ans << endl;

  return 0;
}
