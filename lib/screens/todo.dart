import 'package:flutter/material.dart';
import 'package:todoey/widgets/add_todo_form.dart';
import 'package:todoey/widgets/todo_list.dart';

class TodoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          elevation: 5.0,
          onPressed:  () =>  _onButtonPressed(context),
      ),
      body: SafeArea(
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
                    Text('Todos',
                      style: Theme.of(context).textTheme.title,
                    ),
                  ],
                ),

              ),

              Expanded(
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0)
                        )
                    ),
                    child: TodoList()
                ),
              ),
            ],
          )

      ),
    );
  }

  void _showAddTodoDialog(BuildContext context){
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.6),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                title: Text('Add Todo', style: Theme.of(context).textTheme.title.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff212121),
                    fontSize: 20),
                ),
                content: AddTodoForm(),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 250),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) => null
    );
  }


  void _onButtonPressed(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        builder: (ctx) => Container(
          height: 180,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Container(
                    width: 60,
                    height: 5,
                    alignment: Alignment(0.5, 1.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(192, 192, 192, 0.7),
                      borderRadius: BorderRadius.all(Radius.circular(10)
                    ),
                  ),
                ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
              ),
            ),

          ),

    );
  }


}