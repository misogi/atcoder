#include <iostream>
#include <vector>

using namespace std;
int main() {
  int n, m, totalTime;
  int maxInt = numeric_limits<int>::max();
  cin >> n >> m >> totalTime;
  vector<int> rewards(n);
  for (int i=0; i<n; i++) {
    cin >> rewards[i];
  }

  vector<int> st(m),ed(m),t(m);
  for (int i=0; i<m; i++) {
    cin >> st[i] >> ed[i] >> t[i];
  }

  vector<int> times(n, maxInt);
  vector<short> visited(n);

  int current = 0;
  times[0] = 0;
  // 行き
  while (true) {
    int currentTime = times[current];
    int next = -1;
    int min = maxInt;
    for (int i=0; i<m; i++) {
      if (current+1 == st[i] && visited[i] == 0) {
        int end = ed[i] - 1;
        int newTime = t[i] + currentTime;
        cout << i << " current:" << current << " time:" << currentTime << " " << st[i] << " " << ed[i] << " " << t[i] << endl;
        cout << end << " " << times[end] << " > " << newTime << endl;
        if (times[end] > newTime) {
          times[end] = newTime;
        }

        if (min > newTime) {
          min = newTime;
          next = end;
        }
      }
    }
    visited[current] = 1;
    if (next == -1) {
      int found = 0;
      int min = maxInt;
      for (int i=0; i<n; i++) {
        if (visited[i] == 0) {
          cout << i << " " << times[i] << endl;
        }
        if (visited[i] == 0 && min > times[i]) {
          current = i;
          min = times[i];
          found = 1;
          break;
        }
      }
      if (found == 0) {
        break;
      }
    } else {
      current = next;
    }
  }

  // かえり
  vector<int> backTimes(n, maxInt);
  vector<short> backVisited(n);
  current = 0;
  backTimes[0] = 0;
  while (true) {
    int currentTime = backTimes[current];
    int next = -1;
    int min = maxInt;
    for (int i=0; i<m; i++) {
      if (current+1 == ed[i] && backVisited[i] == 0) {
        int start = st[i] - 1;
        int newTime = t[i] + currentTime;
        if (backTimes[start] > newTime) {
          backTimes[start] = newTime;
        }

        if (min > newTime) {
          min = newTime;
          next = start;
        }
      }
    }

    backVisited[current] = 1;
    if (next == -1) {
      break;
    } else {
      current = next;
    }
  }

  for (auto el : times) {
    cout << el << endl;
  }
}
