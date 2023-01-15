import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/Repository/Repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepo = AuthRepository();

  AuthBloc() : super(LoggingInState()) {
    on<LoadingAuthEvent>((event, emit) {
      try {
        _authRepo.getAuthenticationDetails();
      } catch (error) {
        emit(FailedToLoginState(error: error as Error));
      }
    });
  }
}
