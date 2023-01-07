import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/Repository/Repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late AuthRepository _authRepo;

  AuthBloc() : super(InitialLoginState()) {
    on<LoadingAuthEvent>((event, emit) {
      emit(LoadingLoginsState());
      try {
        _authRepo = AuthRepository();
        _authRepo.getAuthenticationDetails();
        emit(LoadedLoginState());
      } catch (error) {
        emit(FailedToLoginState(error: error as Error));
      }
    });
  }
}
