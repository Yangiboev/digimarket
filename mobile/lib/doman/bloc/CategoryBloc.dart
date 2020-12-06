import 'dart:async';
import 'package:dmp/doman/controller/Controller.dart';
import 'package:dmp/model/CategoryResponse.dart';
import 'package:dmp/model/ProductResponse.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc {
  Controller _controller = Controller();
  StreamSubscription _eventSubscription;

  CategoryBloc() {
    _eventSubscription = _events.listen(_mapEventToState);
  }

  final _event = StreamController<CategoryEvent>();

  Stream<CategoryEvent> get _events => _event.stream;

  void addEvent(CategoryEvent event) {
    _event.sink.add(event);
  }

  final _state = BehaviorSubject<CategoryState>();

  Stream<CategoryState> get state => _state.stream;

  void _setState(CategoryState state) => _state.sink.add(state);

  CategoryState get initialState => CategoryLoadingState();

  CategoryState get lastState => _state.value ?? initialState;

  Future<void> _mapEventToState(CategoryEvent event) async {
    if (event is LoadCategoryEvent) {
      return _loadData();
    }
  }

  Future<void> _loadData() async {
    _setState(CategoryLoadingState());
    final data = await _controller.getCategories();
    if (data is CategoryResponse) {
      _setState(CategoryLoadedState(categories: data.data ?? []));
    } else {
      _setState(CategoryLoadedExceptionState(message: data.toString()));
    }
  }

  void dispose() {
    _eventSubscription.cancel();
    _state.close();
    _event.close();
  }

  Future<List<Product>> getData(String query, String lang) async {
    final data = await _controller.getSearchProduct(query, lang);
    if (data is ProductResponse) {
      return data.data;
    } else {
      _setState(SearchLoadedExceptionState(message: data.toString()));
    }
    return [];
  }
}

class CategoryEvent {}

class LoadCategoryEvent extends CategoryEvent {}

class CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<Categories> categories;

  CategoryLoadedState({this.categories});
}

class CategoryLoadedExceptionState extends CategoryState {
  final String message;

  CategoryLoadedExceptionState({this.message});
}

class SearchLoadedExceptionState extends CategoryState {
  final String message;

  SearchLoadedExceptionState({this.message});
}
