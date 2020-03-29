import 'package:flutter/material.dart';
import 'package:todoey/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget{

  static const String ROUTE = '/register';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 80,
                        child: Image.asset(
                          'assets/images/splash_image.png',
                          fit: BoxFit.contain,
                        )
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Register',
                        style: Theme.of(context).textTheme.body2),
                    SizedBox(
                      height: 20,
                    ),
                    RegisterForm()
                  ],
                ),
              )
          )
      ),
    );
  }

}