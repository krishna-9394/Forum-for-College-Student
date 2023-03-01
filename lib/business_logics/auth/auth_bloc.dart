import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/Repository/auth_repo.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepo = AuthRepository();

  AuthBloc() : super(DataFillingState()) {
    on<AuthEvent>((event, emit) async {
      if (event is Login) {
        emit(LoggingInState());
        try {
          var list = await _authRepo.getLoginResponse(event.username, event.password);
          int statusCode = list[1];
          if (statusCode == 200) {
            Map<String, dynamic> data = jsonDecode(list[0]);
            emit(LoginSuccessState(data: data["response"]));
          } else {
            print("user not found");
            emit(UserNotFoundState());
          }
        } catch (error) {
          emit(FailedToLoginState(error: error.toString()));
        }
      } 
      else if (event is SignUp) {
        emit(SignUpState());
        try {
          var list = await _authRepo.getSignUpResponse(event.username, event.password, event.email);
          int statusCode = list[1];
          if (statusCode == 200) {
            Map<String, dynamic> data = jsonDecode(list[0]);
            emit(SignUpSuccessState(data: data["response"]));
          } else if(statusCode == 400) {
            print("weak password");
            emit(UserAlreadyExist());
          }
        } catch (error) {
          emit(FailedToLoginState(error: error.toString()));
        }
      }
    });
  }
}
