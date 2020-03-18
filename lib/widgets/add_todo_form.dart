import 'package:flutter/material.dart';

class AddTodoForm extends StatefulWidget {

  @override
  _AddTodoFormState createState()=> _AddTodoFormState();

}

class _AddTodoFormState extends State<AddTodoForm> {

  final _formKey = GlobalKey<FormState>();
  final _priorities = ['High', 'Medium', 'Low'];
  String _selectedPriority = 'High';

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
            child: TextFormField(
              decoration: InputDecoration.collapsed(hintText: 'Enter Task'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Priority'),
              DropdownButton<String>(
                items: _priorities.map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                )).toList(),
                onChanged: (val) =>
                  setState(() {
                    _selectedPriority = val;
                  }),
                value: _selectedPriority,

              ),
            ],
          )
        ],
      )
    );
  }

}