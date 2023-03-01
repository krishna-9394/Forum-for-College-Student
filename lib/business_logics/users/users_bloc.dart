import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/Repository/users_repo.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UserRepo repo = UserRepo();
  int pageIndex = 0;

  UsersBloc() : super(UsersInitial()) {
    on<LoadingUsers>((event, emit) async {
      emit(LoadingUsersData());
      try {
        print("reached here in bloc $pageIndex");
        var data = await repo.getUsers(pageIndex);
        pageIndex++;
        var map = data[0];
        bool hasMaxReached = !data[1];
        emit(LoadedUsersData(hasMaxReached, map));
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
