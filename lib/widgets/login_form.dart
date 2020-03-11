import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _key = GlobalKey<FormState>();
  final focusPassword = FocusNode();

  Map<String, String> _formData = {'email': null, 'password': null};

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: <Widget>[
              _buildEmailField(validator: (val) => _emailValidator(val)),
              SizedBox(
                height: 20,
              ),
              _buildPasswordField(validator: (val) => _passwordValidator(val)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Register',
                      style: TextStyle(color: Color(0xffBDBDBD)),
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('Forgot Password?',
                        style: TextStyle(color: Color(0xffBDBDBD))),
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              _buildLoginButton()
            ],
          ),
        ));
  }

  Widget _buildEmailField({Function validator}) {
    return TextFormField(
        validator: (val) => validator(val),
        obscureText: false,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(focusPassword),
        decoration: InputDecoration(
          hintText: 'Email',
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onSaved: (val) => _formData['email'] = val);
  }

  Widget _buildPasswordField({Function validator}) {
    return TextFormField(
        validator: (val) => validator(val),
        obscureText: true,
        keyboardType: TextInputType.text,
        focusNode: focusPassword,
        onFieldSubmitted: (val) => _loginCallback(),
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onSaved: (val) => _formData['password'] = val);
  }

  String _emailValidator(String val) {
    return val.isEmpty ? "Please enter email address" : null;
  }

  String _passwordValidator(String val) {
    return val.length < 6 ? "password cannot  be less than 6 characters" : null;
  }

  Widget _buildLoginButton() {
    final button = Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(32.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        onPressed: () => _loginCallback(),
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Text("Login",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.body1),
      ),
    );

    return button;
  }

  void _loginCallback() {
    if (_key.currentState.validate()) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));

      _key.currentState.save();
      print(_formData);
    }
  }
}
