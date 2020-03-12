import 'package:flutter/material.dart';
import 'package:todoey/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            //  fontFamily: 'Raleway',
            primarySwatch: Colors.indigo,
            accentColor: Colors.yellow,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      color: Color(0xff212121),
                      //fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold),
                  body1: TextStyle(color: Color(0xff212121)),
                  body2: TextStyle(color: Color(0xff212121)),
                ),
            iconTheme: IconThemeData(color: Color(0xffFFFFFF))
        ),

        home: LoginScreen());
  }
}
