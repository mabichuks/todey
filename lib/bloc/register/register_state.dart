import 'package:meta/meta.dart';
import 'package:todoey/models/user.dart';

@immutable
abstract class RegisterState {}

class InitialRegisterState extends RegisterState {}

class RegisterProcessingState extends RegisterState {}

class RegisterCompletedState extends RegisterState {

  final UserModel user;
  RegisterCompletedState(this.user);
}

class RegisterErrorState extends RegisterState {}
