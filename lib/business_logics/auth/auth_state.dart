part of 'auth_bloc.dart';

abstract class AuthState {}

class LoggingInState extends AuthState {}

class LoginSuccessState extends AuthState {}

class UserNotFoundState extends AuthState {}

class FailedToLoginState extends AuthState {
  final Error error;

  FailedToLoginState({required this.error});
}
