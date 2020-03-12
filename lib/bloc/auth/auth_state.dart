import 'package:meta/meta.dart';
import 'package:todoey/models/user.dart';

@immutable
abstract class AuthState {}
  
class InitialAuthState extends AuthState {}

class AuthProcessingState extends AuthState {}

class IsAuthenticatedState extends AuthState {

  final UserModel user;
  IsAuthenticatedState(this.user);
}

class AuthErrorState extends AuthState {}
