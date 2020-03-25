import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/bloc/todo/bloc.dart';
import 'package:todoey/models/todo.dart';
import 'package:todoey/widgets/loading.dart';

import '../bloc/todo/bloc.dart';

class TodoList extends StatefulWidget {

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<String> items = ['Completed', 'Delete'];

  TodoBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of(context);
  }

  blocListener(){
    bloc.listen((state){

    },

    );
  }
  @override
  Widget build(BuildContext context) {

    BlocProvider.of<TodoBloc>(context).add(GetTodoList());

    return BlocBuilder<TodoBloc, TodoState>(builder: (_, state) {
      if (state is TodoLoadingState) {
        return LoadingIndicator(
            Theme.of(context).canvasColor, Theme.of(context).primaryColor);
      }
      if (state is TodoLoadedState) {
        return _buildTodoList(context, state.todoList);
      } else
        return Center(child: Text('Unable to load todos'));
    });
  }

  IconData _getStatusIcon(TodoModel model) {
    switch (model.status) {
      case Status.Done:
        return Icons.check;
      case Status.Pending:
        return Icons.close;
      default:
        return null;
    }
  }

  Color _getPriorityColor(TodoModel model) {
    switch (model.priority) {
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

  Widget _buildTodoList(BuildContext context, List<TodoModel> models) {
    return ListView.builder(
      itemCount: models.length,
      itemBuilder: (ctx, index) => Card(
        key: Key(models[index].id),
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.schedule),
          ),
          trailing:_popOverItem(context),
          title: Text(
            models[index].name,
            style: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: _getPriorityColor(models[index])),
          ),
          onTap: () {},
        ),
      ),
    );
  }

  Widget _popOverItem(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (context) => items.map((item) =>
      PopupMenuItem(
        value: item,
        child: Text(item),
      )
      ).toList(),
      onSelected: (val) => print(val),
    );
  }
}
