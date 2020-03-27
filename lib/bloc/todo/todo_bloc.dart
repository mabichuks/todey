import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:todoey/models/todo.dart';
import 'package:todoey/services/todo/todo_service.dart';
import './bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final TodoService _todoService = TodoService();

  @override
  TodoState get initialState => TodoInitialState();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if(event is GetTodoList) {
      yield* _mapGetTodoListEventToState(event);
    }
    if (event is AddTodo){
      yield* _mapAddTodoEventToState(event);
    }
  }

  Stream<TodoState> _mapGetTodoListEventToState(TodoEvent event) async* {
    yield TodoLoadingState();
    final List<TodoModel> todos = await _todoService.getTodos();
    yield TodoLoadedState(todos);

  }

  Stream<TodoState> _mapAddTodoEventToState(TodoEvent event) async* {

    yield TodoInitialState();

    if(event is AddTodo) {
      //TODO Implement after adding, get new list
      yield TodoSavingState();
      await _todoService.addTodo(event.model);
      yield TodoSavedState();
      await Future.delayed(Duration(milliseconds: 1000));
      yield TodoInitialState();
    }
  }

  Stream<TodoState> _mapDeleteTodoEventToState(TodoEvent event) async* {
    // TODO: Add logic
  }
}
