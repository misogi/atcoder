#include <iostream>
#include <vector>
using namespace std;

int main() {
  int c;
  cin >> c;

  string ans;
  if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') {
    ans = "vowel";
  } else {
    ans = "consonant";
  }

  cout << ans << endl;

  return 0;
}