part of 'counter_bloc.dart';

class CounterScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

//Loading State
class LoadingCounter extends CounterScreenState {
}

//Show State
class ShowCounterValue extends CounterScreenState {
  @override
  List<Object> get props => [counterValue];

  final int counterValue;
  ShowCounterValue(this.counterValue);
}