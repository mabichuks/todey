
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/bloc/auth/auth_bloc.dart';
import 'package:todoey/bloc/auth/auth_state.dart';
import 'package:todoey/bloc/todo/bloc.dart';
import 'package:todoey/screens/home.dart';
import 'package:todoey/screens/login.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
        ),
        BlocProvider<TodoBloc>(
          create: (_) => TodoBloc(),
        )
      ],
      child: MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
                fontFamily: 'Raleway',
              primarySwatch: Colors.indigo,
              accentColor: Colors.yellow,
              canvasColor: Color.fromRGBO(255, 254, 229, 1),
              textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontFamily: 'RobotoCondensed',
                        fontSize: 50,
                        fontWeight: FontWeight.w700),
                    body1: TextStyle(color: Color(0xff212121)),
                    body2: TextStyle(color: Color(0xff212121)),
                  ),
              iconTheme: IconThemeData(color: Color(0xffFFFFFF))
          ),

          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (ctx, state) {
              if( state is InitialAuthState) {
                return LoginScreen();
              }
              if(state is IsAuthenticatedState) {
                return HomeScreen();
              } else
              return LoginScreen();
            }

          )
      );

  }
}

class SimpleBlocDelegate extends BlocDelegate {

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print("=============> Error: $error");
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print("=============> Event: $event");

  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("=============> Transition: $transition");

  }
}
