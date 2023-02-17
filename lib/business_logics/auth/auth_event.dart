part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class LoggingIn extends AuthEvent {
  final String username, password;

  LoggingIn(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class SigningUp extends AuthEvent {
  final String username, password, email;

  SigningUp(this.username, this.password, this.email);

  @override
  List<Object?> get props => [username, password, email];
}
