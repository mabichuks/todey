import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/bloc/todo/bloc.dart';
import 'package:todoey/models/todo.dart';

class AddTodoForm extends StatefulWidget {

  @override
  _AddTodoFormState createState()=> _AddTodoFormState();

}

class _AddTodoFormState extends State<AddTodoForm> {

  final _formKey = GlobalKey<FormState>();
  final _priorities = ['High', 'Medium', 'Low'];
  String _selectedPriority ;
  TextEditingController _textEditingController = TextEditingController();
  bool _disabledPriority=false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              onTap: (){
                setState(() {
                  _disabledPriority= false;
                });
              },
              onEditingComplete: (){
                setState(() {
                  _disabledPriority=true;
                  FocusScope.of(context).requestFocus(FocusNode());
                  print('edit completed event state');
                });
              },
              decoration: InputDecoration.collapsed(hintText: 'Enter Task'),
              textInputAction: TextInputAction.next,
              autofocus: false,
              controller: _textEditingController,
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.white
            ),
            child: DropdownButton<String>(
              items: _disabledPriority ?  _priorities.map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              )).toList() : null,
              onChanged: (val) =>
                  setState(() {
                    _selectedPriority = val;
                  }),
              value: _selectedPriority,
              hint: Text('Priority'),

            ),
          ),
          BlocBuilder<TodoBloc, TodoState>(
            builder: (ctx, state) {
              if(state is TodoInitialState) {
                return _buildSubmitButton(context);
              }
              if(state is TodoSavingState) {
                return CircularProgressIndicator();
              }
              if(state is TodoSavedState) {
                return Icon(Icons.check, color: Colors.green, size: 60,);
              }
              else return _buildSubmitButton(context);
            }
          )
        ],
      )
    );
  }


  Widget _buildSubmitButton(BuildContext context) {
    return RaisedButton(
      child: Text('Add Todo'),
      color: Theme.of(context).primaryColorLight,
      splashColor: Theme.of(context).primaryColorDark,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      onPressed: () => _submitTodoItemCallback(context),
    );
  }

  void _submitTodoItemCallback(BuildContext context) {
    if(_textEditingController.text.isEmpty || _textEditingController.text == null){
      return;
    }

    if(_selectedPriority.isEmpty || _selectedPriority == null) return;

    TodoModel model = TodoModel(id: '12', priority: Priority.High, status: Status.Pending, dateCreated: DateTime.now().toIso8601String(), userId: '21', name: _textEditingController.text);

    BlocProvider.of<TodoBloc>(context).add(AddTodo(model));

    print(model.toString());
  }

}