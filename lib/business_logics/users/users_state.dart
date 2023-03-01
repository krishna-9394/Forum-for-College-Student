part of 'users_bloc.dart';

abstract class UsersState extends Equatable {}

class UsersInitial extends UsersState {
  @override
  List<Object> get props => [];
}

class LoadedUsersData extends UsersState {
  final List<dynamic> map;
  final bool hasReachedMax;

  LoadedUsersData(this.hasReachedMax,this.map);

  @override
  List<Object?> get props => [hasReachedMax,map];
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

class LoadedSingleUsersData extends UsersState {
  final dynamic object;

  LoadedSingleUsersData(this.object);

  @override
  List<Object?> get props => [object];
}

class LoadingSingleUsersData extends UsersState {
  @override
  List<Object?> get props => [];
}

class FailedToLoadSingleUsersData extends UsersState {
  final String error;

  FailedToLoadSingleUsersData(this.error);

  @override
  List<Object?> get props => [error];
}
