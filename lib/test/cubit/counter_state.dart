part of 'counter_cubit.dart';

/// this is the base class all states inherit from
abstract class CounterState {}

/// here we must define the init state
class CounterInitial extends CounterState {}

///
/// our different states like (load, success, faliure, inc, dec,...etc)

class IncreaseState extends CounterState {
  final int count;
  IncreaseState(this.count);
}

class DecreeseState extends CounterState {
  final int count;
  DecreeseState(this.count);
}
