import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class TodoblocBloc extends Bloc<TodoblocEvent, TodoblocState> {
  @override
  TodoblocState get initialState => InitialTodoblocState();

  @override
  Stream<TodoblocState> mapEventToState(
    TodoblocEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
