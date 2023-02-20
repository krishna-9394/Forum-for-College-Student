part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class Login extends AuthEvent {
  final String username, password;

  Login(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class SignUp extends AuthEvent {
  final String username, password, email;

  SignUp(this.username, this.password, this.email);

  @override
  List<Object?> get props => [username, password, email];
}
