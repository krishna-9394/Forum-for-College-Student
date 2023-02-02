part of 'users_bloc.dart';

@immutable
abstract class UsersEvent extends Equatable {}

class LoadingUsers extends UsersEvent {
  LoadingUsers();

  @override
  List<Object?> get props => [];
}
