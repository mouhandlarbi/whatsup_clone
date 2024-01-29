import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:math';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncremented>((event, emit) {
      if (state < 12) {
        emit(state + 1);
      }
    });

    on<CounterDecremented>((event, emit) {
      if (state > 0) {
        emit(state - 1);
      }
    });

    on<CounterRandom>((event, emit) {
      final _random = Random();
      int randomInt = _random.nextInt(13);
      emit(state - state + randomInt);
    });
  }
}
