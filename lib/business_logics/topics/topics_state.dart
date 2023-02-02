part of 'topics_bloc.dart';

abstract class TopicsState extends Equatable {}

class TopicsInitial extends TopicsState {
  @override
  List<Object> get props => [];
}

class LoadedTopicsData extends TopicsState {
  final List<dynamic> map;

  LoadedTopicsData(this.map);

  @override
  List<Object?> get props => [map];
}

class LoadingTopicsData extends TopicsState {
  @override
  List<Object?> get props => [];
}

class FailedToLoadTopicsData extends TopicsState {
  final String error;

  FailedToLoadTopicsData(this.error);

  @override
  List<Object?> get props => [error];
}
