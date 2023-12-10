part of 'counter_bloc.dart';

sealed class CounterState  {
  const CounterState();
}

final class CounterInitial extends CounterState {}

class CounterValue extends CounterState {
  final int counter;
  const CounterValue({required this.counter});
}
