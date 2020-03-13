import 'package:meta/meta.dart';
import 'package:todoey/models/todo.dart';

@immutable
abstract class TodoState {}
  
class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState{}

class TodoLoadedState extends TodoState{

  final List<TodoModel>  todoList;

  TodoLoadedState(this.todoList);
}

class TodoSavingState extends TodoState {}

class TodoSavedState extends TodoState {}

