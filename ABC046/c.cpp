#include <iostream>
#include <vector>
using namespace std;

int main() {
  int n,a,b;
  cin >> n;

  unsigned long long ans, t_a, t_b;
  unsigned long long c_a, c_b, mul;

  cin >> t_a >> t_b;
  for(int i=1;i<n;i++) {
    cin >> a >> b;
    if (a == b) {
      if(t_a < t_b) {
        t_a = t_b;
      }else{
        t_b = t_a;
      }
    } else {
      c_a = (t_a + (a - 1)) / a;
      c_b = (t_b + (b - 1)) / b;
      mul = max(c_a, c_b);
      t_a = mul * a;
      t_b = mul * b;
    }
    // cout << t_a << " " << t_b << endl;
  }

  ans = t_a + t_b;
  cout << ans <<endl;

  return 0;
}
