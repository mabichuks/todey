import 'package:todoey/models/todo.dart';

class TodoService {

    List<TodoModel> todos = [
    TodoModel(
        dateCreated: '01/01/2020',
        userId: '1223',
        id: '1',
        name: 'Buy Groceries',
        priority: Priority.High,
        status: Status.Pending),
    TodoModel(
        dateCreated: '01/01/2020',
        userId: '1223',
        id: '1',
        name: 'Buy Clothes',
        priority: Priority.Low,
        status: Status.Done),
    TodoModel(
        dateCreated: '01/01/2020',
        userId: '1223',
        id: '1',
        name: 'Do Assignment',
        priority: Priority.Medium,
        status: Status.Pending)
  ];


    void addTodo(TodoModel model) {
      todos.add(model);
    }

    Future<List<TodoModel>> getTodos() {
      return Future.delayed(Duration(seconds: 2), ()=> todos);
    }


}