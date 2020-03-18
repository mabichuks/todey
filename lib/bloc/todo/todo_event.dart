import 'package:meta/meta.dart';
import 'package:todoey/models/todo.dart';

@immutable
abstract class TodoEvent {}

class GetTodoList extends TodoEvent {}

class SaveTodo extends TodoEvent {
  final TodoModel model;

  SaveTodo(this.model);
}

class AddTodo extends TodoEvent {

  final TodoModel model;
  AddTodo(this.model);
}

class DeleteTodo extends TodoEvent {
  final String todoId;

  DeleteTodo(this.todoId);
}




