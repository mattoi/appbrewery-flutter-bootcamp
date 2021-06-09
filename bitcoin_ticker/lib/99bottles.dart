void main() {
  int startingBottles = 10;
  for (int n = startingBottles; n > 0; n--) {
    print(
        '$n bottles of beer on the wall, $n bottles of beer.\nTake down and pass it around, ${n - 1} bottles of beer on the wall.');
  }
}
