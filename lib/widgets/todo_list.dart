import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/bloc/todo/bloc.dart';
import 'package:todoey/models/todo.dart';

class TodoList extends StatelessWidget {



  final List<TodoModel> models;
  TodoList(this.models);

  @override
  Widget build(BuildContext context) {


    return _buildTodoList(context, models);
  }

  IconData _getStatusIcon(TodoModel model) {
    switch(model.status){
      case Status.Done:
        return Icons.check;
      case Status.Pending:
        return Icons.close;
      default:
        return null;

    }
  }

  Widget _buildTodoList(BuildContext context, List<TodoModel> models) {
   return ListView.builder(
      itemCount: models.length,
      itemBuilder: (ctx, index) =>Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.schedule),
          ),
          trailing: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(_getStatusIcon(models[index])),
          ),
          title: Text(models[index].name, style: Theme.of(context).textTheme.body1.copyWith(
              color: _getPriorityColor(models[index])
          ),),
          onTap: () {},

        ),
      ),


    );
  }

  Color _getPriorityColor(TodoModel model) {
    switch(model.priority) {
      case Priority.High:
        return Colors.red;
      case Priority.Medium:
        return Color(0xffc68400);
      case Priority.Low:
        return Colors.green;
      default:
        return Colors.white;
    }
  }
}
