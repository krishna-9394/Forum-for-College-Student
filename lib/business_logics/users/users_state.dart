part of 'users_bloc.dart';

abstract class UsersState extends Equatable {}

class UsersInitial extends UsersState {
  @override
  List<Object> get props => [];
}

class LoadedUsersData extends UsersState {
  final List<dynamic> map;

  LoadedUsersData(this.map);

  @override
  List<Object?> get props => [map];
}

class LoadingUsersData extends UsersState {
  @override
  List<Object?> get props => [];
}

class FailedToLoadUsersData extends UsersState {
  final String error;

  FailedToLoadUsersData(this.error);

  @override
  List<Object?> get props => [error];
}
