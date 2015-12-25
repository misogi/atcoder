#include <cstdio>
#include <iostream>
#include <sstream>
#include <fstream>
#include <iterator>
#include <iomanip>
#include <algorithm>
#include <cmath>
#include <string>
#include <vector>
#include <list>
#include <queue>
#include <stack>
#include <set>
#include <map>
#include <bitset>
#include <numeric>
#include <limits>
#include <climits>
#include <cfloat>
#include <functional>
using namespace std;

typedef long long ll;

ll modpow(ll x, ll p, ll mod) {
  ll ret = 1;
  while (p) {
    if (p & 1) ret = ret * x % mod;
    x = x * x % mod;
    p >>= 1;
  }
  return ret;
}

ll sum(ll a, ll r, ll n, ll mod) {
  if (n == 1) return a % mod;

  ll x = sum(a, r, n / 2, mod);
  ll ret = (x + modpow(r, n / 2, mod) * x) % mod;
  if (n & 1) ret = (a + r * ret) % mod;
  return ret;
}

int main() {
  ll N;
  ll X, T, A, B, mod;
  cin >> N;
  cin >> X >> T >> A >> B >> mod;

  ll ans = 0;
  ll At = modpow(A, T, mod);
  ll S = sum(B, A, T, mod);
  for (int i = 0; i < N; ++i) {
    ans += X;
    if (A == 1) {
      X = X + T * B;
      X %= mod;
      continue;
    }
    X = At * X + S;
    X %= mod;
  }
  cout << ans << endl;
}
