import 'package:flutter/material.dart';
import 'package:todoey/models/todo.dart';

class TodoList extends StatelessWidget {


  final List<TodoModel> models;
  TodoList(this.models);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: models.length,
        itemBuilder: (ctx, index) => ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.schedule),
          ),
          title: Text(models[index].name, style: Theme.of(context).textTheme.body1,),
          onTap: () {},

        )
    );
  }
}
