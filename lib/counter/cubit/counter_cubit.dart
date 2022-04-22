import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//   void increment() => emit(state + 1);

//   void decrement() => emit(state == 0 ? state : state - 1);
// }

class CounterCubit extends Cubit<CounterState> {
  int countA, countB;
  CounterCubit({this.countA = 0, this.countB = 0})
      : super(const CounterInitial());
  void increment() {
    countA++;

    emit(CounterIncrement(countA, countB));
  }

  void resetCounter() {
    countA = 0;
    countB = 0;
    emit(CounterReset(countA, countB));
  }

  void incrementB() {
    countB++;
    emit(CounterIncrement(countA, countB));
  }

  void decrement() {
    countA == 0 ? countA : countA--;

    emit(CounterDecrement(countA, countB));
  }

  void decrementB() {
    countB == 0 ? countB : countB--;
    emit(CounterDecrement(countA, countB));
  }
}
