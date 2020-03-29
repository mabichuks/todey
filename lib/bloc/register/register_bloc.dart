import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:todoey/models/login.dart';
import 'package:todoey/models/user.dart';
import './bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  RegisterState get initialState => InitialRegisterState();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if(event is RegisterUserEvent) {
      yield* _mapRegisterUserEventToState(event);
    }
  }

  Stream<RegisterState> _mapRegisterUserEventToState(RegisterEvent event) async* {
    yield RegisterProcessingState();
    RegisterUserEvent ev = event;
    //LoginModel model = LoginModel(email: 'mail@mail.com', password: 'password');
    final UserModel user = await _doRegister(ev.model);
    yield RegisterCompletedState(user);
  }

  Future<UserModel> _doRegister(LoginModel model) {
    return Future.delayed(Duration(seconds: 2), () => UserModel(
        id: '12345abc',
        email: model.email
    ));
  }

}
