import 'package:flutter/material.dart';
import 'package:todoey/services/todo/todo_service.dart';
import 'package:todoey/widgets/add_todo_form.dart';
import 'package:todoey/widgets/todo_list.dart';

class HomeScreen extends StatelessWidget {

   final TodoService _todoService = TodoService();


   void _showAddTodoDialog(BuildContext context){
     showGeneralDialog(
         barrierColor: Colors.black.withOpacity(0.5),
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


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 5.0,
        onPressed:  () =>  _showAddTodoDialog(context)
      ),
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
                  child: TodoList(_todoService.todos),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }

}