import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_testing/data/repositories/remote/random_counter/CounterRepo.dart';
import 'package:flutter_bloc_testing/data/repositories/remote/random_counter/CunterRepoImpl.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterScreenBloc extends Bloc<CounterEvent, CounterScreenState> {
  CounterScreenBloc() : super(ShowCounterValue(1));

  int counterValue = 0;

  CounterScreenState get initialState => ShowCounterValue(counterValue);

  CounterRepo get counterRepo => CounterRepoImpl();

  @override
  Stream<CounterScreenState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementValue) {
      print("increment call in bloc");
      this.counterValue++;
      yield ShowCounterValue(counterValue);
    }
    if (event is DecrementValue) {
      print("decrement call in bloc");
      this.counterValue--;
      yield ShowCounterValue(counterValue);
    }
    if (event is RandomNumberValue) {
      yield LoadingCounter();
      this.counterValue = await counterRepo.generateNegativeNumber();
      print("randomNumber call in bloc");
      yield ShowCounterValue(counterValue);
    }
  }
}
