import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

/// here we do hour logic
///
///

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int count = 0;
  void increase() {
    count++;

    /// this function emits new state to UI
    emit(IncreaseState(count));
  }

  void decrease() {
    count--;
    emit(DecreeseState(count));
  }
}
