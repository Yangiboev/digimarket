import 'dart:async';
import 'package:dmp/doman/controller/Controller.dart';
import 'package:dmp/model/NewsResponse.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  Controller _controller = Controller();
  StreamSubscription _eventSubscription;

  NewsBloc() {
    _eventSubscription = _events.listen(_mapEventToState);
  }

  final _event = StreamController<NewsEvent>();

  Stream<NewsEvent> get _events => _event.stream;

  void addEvent(NewsEvent event) {
    _event.sink.add(event);
  }

  final _state = BehaviorSubject<NewsState>();

  Stream<NewsState> get state => _state.stream;

  void _setState(NewsState state) => _state.sink.add(state);

  NewsState get initialState => NewsLoadingState();

  NewsState get lastState => _state.value ?? initialState;

  Future<void> _mapEventToState(NewsEvent event) async {
    if (event is LoadNewsEvent) {
      return _loadData();
    }
  }

  Future<void> _loadData() async {
    _setState(NewsLoadingState());
    final data = await _controller.getNews();
    if (data is NewsResponse) {
      _setState(NewsLoadedState(news: data.news ?? []));
    } else {
      _setState(NewsLoadedExceptionState(message: data.toString()));
    }
  }

  void dispose() {
    _eventSubscription.cancel();
    _state.close();
    _event.close();
  }
}

class NewsEvent {}

class LoadNewsEvent extends NewsEvent {}

class NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<News> news;

  NewsLoadedState({this.news});
}

class NewsLoadedExceptionState extends NewsState {
  final String message;

  NewsLoadedExceptionState({this.message});
}
