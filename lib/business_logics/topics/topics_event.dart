part of 'topics_bloc.dart';

abstract class TopicsEvent extends Equatable {}

class LoadingTopics extends TopicsEvent {
  final int cid;

  LoadingTopics(this.cid);

  @override
  List<Object?> get props => [cid];
}
