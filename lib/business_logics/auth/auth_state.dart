part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class LoggingInState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends AuthState {
  @override
  List<Object?> get props => [];
}

class UserNotFoundState extends AuthState {
  @override
  List<Object?> get props => [];
}

class FailedToLoginState extends AuthState {
  final Error error;

  FailedToLoginState({required this.error});

  @override
  List<Object?> get props => [error];
}

class SignUpState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignUpSuccessState extends AuthState {
  @override
  List<Object?> get props => [];
}

class UserFoundState extends AuthState {
  @override
  List<Object?> get props => [];
}

class FailedToSignUpState extends AuthState {
  final Error error;

  FailedToSignUpState({required this.error});

  @override
  List<Object?> get props => [error];
}
