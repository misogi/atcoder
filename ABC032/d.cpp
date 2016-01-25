#include <iostream>
#include <vector>
#include <map>

using namespace std;

int main() {
    int n, w, v_highest = 0;
    cin >> n >> w;
    vector<int> weights(n), values(n);
    for (int i = 0; i<n; i++) {
        cin >> values[i] >> weights[i];
        if (v_highest < values[i]) v_highest = values[i];
    }

    if (n <= 30) {
        map<long, long> ms, second_half;
        int halfn = n / 2;
        for (auto i = 0; i<(1 << halfn); i++) {
            long w_sum = 0, v_sum = 0;
            for (auto j = 0; j<halfn; j++) {
                if ((1 << j) & i) {
                    w_sum += weights[j];
                    v_sum += values[j];
                }
            }

            if (w_sum <= w) {
                if (ms.count(w_sum) == 1) {
                    if (ms[w_sum] < v_sum) {
                        ms[w_sum] = v_sum;
                    }
                }
                else {
                    ms[w_sum] = v_sum;
                }
            }
        }

        for (auto i = 0; i<(1 << (n - halfn)); i++) {
            long w_sum = 0, v_sum = 0;
            for (int j = 0; j<(n - halfn); j++) {
                if ((1 << j) & i) {
                    v_sum += values[halfn + j];
                    w_sum += weights[halfn + j];
                }
            }

            if (w_sum <= w) {
                if (second_half.count(w_sum) == 1) {
                    if (second_half[w_sum] < v_sum) {
                        second_half[w_sum] = v_sum;
                    }
                }
                else {
                    second_half[w_sum] = v_sum;
                }
            }
        }

        long ans = 0;
        for (auto fst : ms) {
            for (auto snd : second_half) {
                if (fst.first + snd.first <= w) {
                    long value = fst.second + snd.second;
                    if (ans < value) {
                        ans = value;
                    }
                }
            }
        }

        cout << ans << endl;
    } else if (v_highest <= 1000) {
        // all values are < 1000
        int nvmax = 1001 * n;
        vector<vector<uint64_t>> dp(n + 1, vector<uint64_t>(nvmax, 1000000000 * n));
        dp[0][0] = 0;
        for (int i = 1; i<n + 1; i++) {
            int vi = values[i - 1];
            int wi = weights[i - 1];
            for (int j = 0; j<vi; j++) {
                dp[i][j] = dp[i - 1][j];
            }

            for (int j = vi; j<nvmax; j++) {
                dp[i][j] = min(dp[i - 1][j], dp[i - 1][j - vi] + wi);
            }
        }

        int max_v = 0;
        for (int i = 0; i<nvmax; i++) {
            if (dp[n][i] <= w && max_v < i) {
                max_v = i;
            }
        }

        cout << max_v << endl;
    } else {
        int nwmax = w + 1;
        vector<long> dp(nwmax, 0);
        dp[0] = 0;
        for (int i = 0; i<n; i++) {
            int wi = weights[i];
            int vi = values[i];
            for (int j = nwmax - 1; j >= wi; j--) {
                dp[j] = max(dp[j], dp[j - wi] + vi);
            }
        }

        cout << dp[w] << endl;
    }

    return 0;
}
