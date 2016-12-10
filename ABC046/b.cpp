#include <iostream>
#include <vector>
using namespace std;

int main() {
  int n,k;
  cin >> n >> k;

  unsigned long long ans;

  ans = k;
  for(int i=1;i<n;i++) {
    ans = ans * (k-1);
  }

  cout << ans <<endl;

  return 0;
}
