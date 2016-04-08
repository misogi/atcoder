#include <iostream>
#include <map>
#include <vector>
#include <numeric>

using namespace std;
int main() {
  int n;
  int r, h;
  map<int, vector<int>> rates;

  cin >> n;
  vector<int> players(n);
  vector<short> hands(n);

  for (int i=0; i<n; i++) {
    cin >> r >> h;
    rates[r][h] += 1;
    cout << "w" << endl;
    players[i] = r;
    hands[i] = h;
  }

  int win = 0;
  map<int, int> wins;
  for (auto &rate : rates) {
    wins[rate.first] = win;
    int w = accumulate(rate.second.begin(), rate.second.end(), 0);
    cout << w << endl;
  }

  for (int i=0; i<n; i++) {
    int p = players[i];
    cout << p << " " << wins[p] << endl;
  }

  return 0;
}
