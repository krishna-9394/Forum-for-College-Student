part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class DataFillingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoggingInState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends AuthState {
  final Map<String, dynamic> data;
  LoginSuccessState({required this.data});

  @override
  List<Object?> get props => [data];
}

class UserNotFoundState extends AuthState {
  @override
  List<Object?> get props => [];
}

class UserAlreadyExist extends AuthState {
  @override
  List<Object?> get props => [];
}

class FailedToLoginState extends AuthState {
  final String error;

  FailedToLoginState({required this.error});

  @override
  List<Object?> get props => [error];
}

class SignUpState extends AuthState {
  @override
  List<Object?> get props => [];
}

class SignUpSuccessState extends AuthState {
  final Map<String, dynamic> data;
  SignUpSuccessState({required this.data});
  @override
  List<Object?> get props => [data];
}

class FailedToSignUpState extends AuthState {
  final Error error;

  FailedToSignUpState({required this.error});

  @override
  List<Object?> get props => [error];
}
