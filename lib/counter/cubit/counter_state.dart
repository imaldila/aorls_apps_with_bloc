part of 'counter_cubit.dart';

@immutable
abstract class CounterState extends Equatable {
  final int countA, countB;
  const CounterState(this.countA, this.countB);
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(0,0);

  @override
  List<Object?> get props => [];
}

class CounterIncrement extends CounterState {
  const CounterIncrement(int countA, countB) : super(countA, countB);

  @override
  List<Object?> get props => [countA, countB];
}

class CounterDecrement extends CounterState {
  const CounterDecrement(int countA, countB) : super(countA, countB);

  @override
  List<Object?> get props => [countA, countB];
}
