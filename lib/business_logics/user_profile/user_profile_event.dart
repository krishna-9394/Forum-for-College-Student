part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {}

class LoadProfile extends UserProfileEvent {
  final int uid;
  LoadProfile({required this.uid});
  @override
  List<Object?> get props => [uid];
}
