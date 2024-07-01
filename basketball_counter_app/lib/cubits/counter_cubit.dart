import 'package:basketball_counter_app/cubits/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitialState());
  int counterA = 0;
  int counterB = 0;

  void counterIncrement({required String team, required int buttonNumber}) {
    switch (team) {
      case 'A':
        counterA += buttonNumber;
        emit(CounterAIncrementState());
        break;
      case 'B':
        counterB += buttonNumber;
        emit(CounterBIncrementState());
        break;
    }
  }

  void counterReset() {
    counterA = 0;
    counterB = 0;
    emit(CounterResetState());
  }
}
