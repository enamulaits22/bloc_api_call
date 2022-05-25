import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_app/data/model/news_model.dart';
import 'package:test_app/data/repository/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;

  NewsBloc(this._newsRepository) : super(NewsLoadingState()) {
    on<LoadNewsEvent>((event, emit) async {
      emit(NewsLoadingState());
      try {
        final news = await _newsRepository.getNews();
        emit(NewsLoadedState(news));
      } catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    });
  }
}