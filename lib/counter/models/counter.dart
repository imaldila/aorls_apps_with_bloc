class Counter {
  int countA, countB;
  Counter(this.countA, this.countB);
}

class CounterModel {
  List<Counter> counterModel = [
    Counter(
      0,
      0,
    )
  ];
}
