import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/Repository/users_repo.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UserRepo repo = UserRepo();

  UsersBloc() : super(UsersInitial()) {
    on<LoadingUsers>((event, emit) async {
      emit(LoadingUsersData());
      try {
        List<dynamic> map = await repo.getUsers();
        emit(LoadedUsersData(map));
      } catch (e) {
        emit(FailedToLoadUsersData(e.toString()));
      }
    });
    on<LoadingSingleUser>((event, emit) async {
      emit(LoadingSingleUsersData());
      try {
        dynamic object = await repo.getSingleUser(event.uid);
        emit(LoadedSingleUsersData(object));
      } catch (e) {
        emit(FailedToLoadSingleUsersData(e.toString()));
      }
    });
  }
}
