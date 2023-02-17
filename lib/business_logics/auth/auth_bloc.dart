import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/Repository/Repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepo = AuthRepository();

  AuthBloc() : super(LoggingInState()) {
    on<LoggingIn>((event, emit) {
      try {
        _authRepo.getLoginResponse(event.username, event.password);
      } catch (error) {
        emit(FailedToLoginState(error: error as Error));
      }
    });
    on<SigningUp>((event, emit) {
      try {
        _authRepo.getSignUpResponse(event.username, event.password, event.email);
      } catch (error) {
        emit(FailedToSignUpState(error: error as Error));
      }
    });
  }
}
