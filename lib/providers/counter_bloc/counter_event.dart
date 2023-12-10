part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}

class ResetCounter extends CounterEvent {}
