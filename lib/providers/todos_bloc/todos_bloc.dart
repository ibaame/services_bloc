import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:services_bloc/api/todo_api.dart';

import '../../models/todo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosApi todosApi;
  TodosBloc(this.todosApi) : super(LoadingState()) {
    on<TodosEvent>((event, emit) async {
      if (event is GetAllTodosEvent) {
        emit(LoadingState());
        try {
          final todos = await todosApi.getAllTodos();
          emit(LoadedState(todos: todos));
        } catch (e) {
          emit(const ErrorState(
              message: "Something Went Wrong, Please Try Again Later!"));
        }
      }
    });
  }
}
