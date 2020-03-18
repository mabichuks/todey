import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:todoey/models/login.dart';
import 'package:todoey/models/user.dart';
import './bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => InitialAuthState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if(event is AuthEvent) {
      yield* _mapLoginEventToState(event);
    }
  }

  Stream<AuthState> _mapLoginEventToState(AuthEvent event) async* {
    yield AuthProcessingState();
    LoginEvent ev = event;
    //LoginModel model = LoginModel(email: 'mail@mail.com', password: 'password');
    final UserModel user = await _doLogin(ev.model);
    yield IsAuthenticatedState(user);
  }

  Future<UserModel> _doLogin(LoginModel model) {
    return Future.delayed(Duration(seconds: 2), () => UserModel(
      id: '12345abc',
      email: model.email
    ));
  }

}
