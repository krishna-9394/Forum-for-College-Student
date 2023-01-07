part of 'auth_bloc.dart';

abstract class AuthState {}

class InitialLoginState extends AuthState {}

class LoadingLoginsState extends AuthState {}

class LoadedLoginState extends AuthState {}

class FailedToLoginState extends AuthState {
  final Error error;

  FailedToLoginState({required this.error});
}
