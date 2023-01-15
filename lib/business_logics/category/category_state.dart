part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class LoadedCategoryData extends CategoryState {
  final Map<String, dynamic> map;

  LoadedCategoryData(this.map);

  @override
  List<Object?> get props => [map];
}

class LoadingCategoryData extends CategoryState {
  @override
  List<Object?> get props => [];
}

class FailedToLoadData extends CategoryState {
  final String error;

  FailedToLoadData(this.error);

  @override
  List<Object?> get props => [error];

}
