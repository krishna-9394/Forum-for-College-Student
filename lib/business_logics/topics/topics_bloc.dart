import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:node_bb_application/data/Repository/topics_repo.dart';

part 'topics_event.dart';
part 'topics_state.dart';

class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  TopicRepo repo = TopicRepo();

  TopicsBloc() : super(TopicsInitial()) {
    on<LoadingTopics>((event, emit) async {
      emit(LoadingTopicsData());
      try {
        List<dynamic> map = await repo.getTopics(event.cid);
        emit(LoadedTopicsData(map));
      } catch (e) {
        emit(FailedToLoadTopicsData(e.toString()));
      }
    });
  }
}
