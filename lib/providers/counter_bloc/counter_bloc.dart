import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    int counter = 0;
    on<CounterEvent>((event, emit) {
      if (event is IncrementCounter) {
        counter += 1;
        emit(CounterValue(counter: counter));
      } else if (event is DecrementCounter) {
        counter -= 1;
        emit(CounterValue(counter: counter));
      } else {
        counter = 0;
        emit(CounterValue(counter: counter));
      }
    });
  }
}
