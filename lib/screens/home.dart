import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:todoey/screens/account.dart';
import 'package:todoey/screens/todo.dart';
import 'package:todoey/services/todo/todo_service.dart';
import 'package:todoey/widgets/add_todo_form.dart';
import 'package:todoey/widgets/todo_list.dart';

import '../widgets/todo_list.dart';
import 'history.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final TodoService _todoService = TodoService();
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    TodoScreen(),
    HistoryScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: Container(
        color: Theme.of(context).canvasColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 10,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Theme.of(context).primaryColor,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                  iconColor: Theme.of(context).primaryColorDark,
                ),
                GButton(
                  icon: LineIcons.history,
                  text: 'History',
                  iconColor: Theme.of(context).primaryColorDark,
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Account',
                  iconColor: Theme.of(context).primaryColorDark,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
