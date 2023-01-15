part of "category_bloc.dart";

abstract class CategoryEvent extends Equatable {}

class LoadCategories extends CategoryEvent {
  LoadCategories();

  @override
  List<Object?> get props => [];
}
