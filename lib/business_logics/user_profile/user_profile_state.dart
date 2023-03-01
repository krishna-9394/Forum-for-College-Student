part of 'user_profile_bloc.dart';

abstract class UserProfileState extends Equatable {}

class UserProfileInitial extends UserProfileState {
  @override
  List<Object?> get props => [];
}

class UserProfileLoading extends UserProfileState {
  @override
  List<Object?> get props => [];
}

class UserNotFound extends UserProfileState {
  @override
  List<Object?> get props => [];
}

class FailedLoadingProfile extends UserProfileState {
  final String error;
  FailedLoadingProfile(this.error);
  @override
  List<Object?> get props => [error];
}

class UserProfileLoaded extends UserProfileState {
  final Map<String, dynamic> data;
  UserProfileLoaded(this.data);
  @override
  List<Object?> get props => [data];
}
