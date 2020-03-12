import 'package:flutter/material.dart';
import 'package:todoey/models/todo.dart';
import 'package:todoey/widgets/todo_list.dart';

class HomeScreen extends StatelessWidget {

  final List<TodoModel> todos = [
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
        priority: Priority.High,
        status: Status.Pending)
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 60.0, left: 30.0, right: 30.0, bottom: 30.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(
                          Icons.list,
                        size: 30,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    SizedBox(height: 10.0,),
                    Text('Todoey',
                      style: Theme.of(context).textTheme.title,
                    ),
                  ],
                ),

              ),

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)
                    )
                  ),
                  child: TodoList(todos),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }

}