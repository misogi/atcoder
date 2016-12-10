#include <iostream>
#include <vector>
using namespace std;

int main() {
  unsigned long long a,b,x;
  cin >> a >> b >> x;

  unsigned long long ans, mod, st, ed, mod2;
  mod = a % x;
  if (mod == 0) {
    st = a;
  } else {
    st = a + (x - mod);
  }

  mod2 = b % x;
  ed = b - mod2;

  // cout << st << " " << ed << endl;
  if (st > ed) {
    ans = 0;
  } else {
    ans = (ed - st) / x;
    ans += 1;
  }

  cout << ans << endl;

  return 0;
}