import 'package:meta/meta.dart';
import 'package:todoey/models/login.dart';

@immutable
abstract class RegisterEvent {}

class RegisterUserEvent extends RegisterEvent {
  final LoginModel model;

  RegisterUserEvent(this.model);
}
