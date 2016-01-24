#include <iostream>
#include <vector>
#include <map>

using namespace std;

int main() {
  uint64_t n, w;
  cin >> n >> w;
  vector<uint> weights(n), values(n);
  for (auto i=0;i<n;i++) {
    cin >> values[i] >> weights[i];
  }

  map<uint64_t, uint64_t> ms, second_half;
  int halfn = n / 2;
  for (auto i=0;i<(1 << halfn);i++) {
    uint64_t w_sum = 0, v_sum = 0;
    for (auto j=0;j<halfn;j++) {
      if ((1 << j) & i){
        w_sum += weights[j];
        v_sum += values[j];
      }
    }

    if (w_sum <= w) {
      if (ms.count(w_sum) == 1) {
        if (ms[w_sum] < v_sum) {
          ms[w_sum] = v_sum;
        }
      } else {
        ms[w_sum] = v_sum;
      }
    }
  }

  for (auto i=0;i<(1 << (n-halfn));i++) {
    uint64_t w_sum = 0, v_sum = 0;
    for (auto j=0;j<(n-halfn);j++) {
      if ((1 << j) & i) {
        v_sum += values[halfn+j];
        w_sum += weights[halfn+j];
      }
    }

    if (w_sum <= w) {
      if (second_half.count(w_sum) == 1) {
        if (second_half[w_sum] < v_sum) {
          second_half[w_sum] = v_sum;
        }
      } else {
        second_half[w_sum] = v_sum;
      }
    }
  }

  uint64_t ans = 0;
  for (auto fst : ms) {
    for (auto snd : second_half) {
      if (fst.first + snd.first < w) {
        uint64_t value = fst.second + snd.second;
        if (ans < value) {
          ans = value;
        }
      }
    }
  }

  cout << ans << endl;
}
