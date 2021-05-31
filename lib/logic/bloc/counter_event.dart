part of 'counter_bloc.dart';

class CounterEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class IncrementValue extends CounterEvent{}

class DecrementValue extends CounterEvent{}

class RandomNumberValue extends CounterEvent{}


