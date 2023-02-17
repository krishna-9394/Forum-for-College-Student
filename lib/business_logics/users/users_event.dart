part of 'users_bloc.dart';

@immutable
abstract class UsersEvent extends Equatable {}

class LoadingUsers extends UsersEvent {
  LoadingUsers();

  @override
  List<Object?> get props => [];
}

class LoadingSingleUser extends UsersEvent {
  final int uid;

  LoadingSingleUser(this.uid);

  @override
  // TODO: implement props
  List<Object?> get props => [uid];

}
