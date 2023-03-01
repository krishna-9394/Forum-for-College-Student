import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:node_bb_application/data/Repository/user_profile.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  ProfileRepo profile = ProfileRepo();
  UserProfileBloc() : super(UserProfileInitial()) {
    on<LoadProfile>((event, emit) async {
      emit(UserProfileLoading());
      try {
        var list = await profile.getUserByUid(event.uid);
        int statusCode = list[1];
        if (statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(list[0]);
          emit(UserProfileLoaded(data));
        } else {
          print("user not found");
          emit(UserNotFound());
        }
      } catch (error) {
        print(error);
        emit(FailedLoadingProfile(error.toString()));
      }
    });
  }
}
