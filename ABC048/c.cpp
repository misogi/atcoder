#include <iostream>
#include <vector>
using namespace std;

int main() {
  int n, max;
  cin >> n >> max;
  vector<int> ames(n, 0);
  unsigned long long eat = 0;
  for(int i=0;i<n;i++) {
    int ame;
    cin >> ame;
    int tot;
    if (i == 0) {
      tot = ame;
    } else {
      tot = ame + ames[i-1];
    }
     
    if (tot > max) {
      int e = tot - max;
      eat += e;
      ame -= e;
    }
    // cout << eat << " ";
    ames[i] = ame;
  }

  cout << eat << endl;

  return 0;
}