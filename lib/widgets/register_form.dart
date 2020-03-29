import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:todoey/bloc/register/bloc.dart';
import 'package:todoey/models/login.dart';

class RegisterForm extends StatefulWidget{

  @override
  _RegisterFormState createState() => _RegisterFormState();


}

class _RegisterFormState extends State<RegisterForm> {


  final _key = GlobalKey<FormState>();
  final focusPassword = FocusNode();
  final focusConfirmPassword = FocusNode();
  ProgressDialog pr;
  Map<String, String> _formData = {'email': null, 'password': null, 'confirmPassword': null};

  @override
  Widget build(BuildContext context) {
    _initProgressDialog(context);
    return Form(
        key: _key,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterProcessingState) {
                pr.show();
              }

              if(state is RegisterCompletedState) {
                pr.hide();
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Successfully registered'))
                );

              }
            },
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (ctx, state) => Column(
                children: <Widget>[
                  _buildEmailField(validator: (val) => _emailValidator(val)),
                  SizedBox(
                    height: 20,
                  ),
                  _buildPasswordField(
                      validator: (val) => _passwordValidator(val)),
                  SizedBox(
                    height: 20,
                  ),
                  _buildConfirmPasswordField(validator: (val) => _confirmPasswordValidator(val)),
                  SizedBox(
                    height: 20,
                  ),
                  _buildRegisterButton(context),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildEmailField({Function validator}) {
    return TextFormField(
        validator: (val) => validator(val),
        obscureText: false,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (val) {
          _formData['email'] = val;
          //_key.currentState.save();
          FocusScope.of(context).requestFocus(focusPassword);},
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
        onFieldSubmitted: (val) {
          _formData['password'] = val;
          FocusScope.of(context).requestFocus(focusConfirmPassword);
        },
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onSaved: (val) => _formData['password'] = val);
  }

  Widget _buildConfirmPasswordField({Function validator}) {
    return TextFormField(
        validator: (val) => validator(val),
        obscureText: true,
        keyboardType: TextInputType.text,
        focusNode: focusConfirmPassword,
        onFieldSubmitted: (val) => _registerCallback(),
        decoration: InputDecoration(
          hintText: 'Confirm Password',
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
        onSaved: (val) => _formData['confirmPassword'] = val);
  }

  String _emailValidator(String val) {
    return val.isEmpty ? "Please enter email address" : null;
  }

  String _passwordValidator(String val) {
    return val.length < 6 ? "password cannot  be less than 6 characters" : null;
  }

  String _confirmPasswordValidator(String val) {
    return _formData['password'] != val ? 'Passwords do not match' : null;
  }

  Widget _buildRegisterButton(BuildContext ctx) {
    final button = Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(32.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        onPressed: () => _registerCallback(),
        minWidth: MediaQuery.of(ctx).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: Text("Register",
            textAlign: TextAlign.center, style: Theme.of(ctx).textTheme.body1),
      ),
    );

    return button;
  }

  void _registerCallback() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      LoginModel model = LoginModel(
          email: _formData['email'], password: _formData['password']);
      BlocProvider.of<RegisterBloc>(context).add(RegisterUserEvent(model));
      print(_formData);
    }
  }

  void _initProgressDialog(BuildContext ctx) {
    pr = ProgressDialog(
      ctx,
      type: ProgressDialogType.Normal,

    );

    pr.style(
        message: 'Signing in',
        messageTextStyle: Theme.of(context).textTheme.body1,
        borderRadius: 10.0,
        insetAnimCurve: Curves.easeInOut
    );
  }

}