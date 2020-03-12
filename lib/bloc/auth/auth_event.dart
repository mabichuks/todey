import 'package:meta/meta.dart';
import 'package:todoey/models/login.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginModel model;

  LoginEvent(this.model);
}

class LogoutEvent extends AuthEvent {}
