import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/Repository/category_repo.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryRepo repo = CategoryRepo();

  CategoryBloc() : super(CategoryInitial()) {
    on<LoadCategories>((event, emit) async {
      emit(LoadingCategoryData());
      try {
        Map<String, dynamic> map = await repo.getCategories();
        emit(LoadedCategoryData(map));
      } catch (e) {
        emit(FailedToLoadData(e.toString()));
      }
    });
  }
}
