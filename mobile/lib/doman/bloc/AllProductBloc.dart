import 'dart:async';
import 'package:dmp/doman/controller/Controller.dart';
import 'package:dmp/model/ProductResponse.dart';
import 'package:rxdart/rxdart.dart';

class AllProductBloc {
  Controller _controller = Controller();
  StreamSubscription _eventSubscription;

  AllProductBloc() {
    _eventSubscription = _events.listen(_mapEventToState);
  }

  final _event = StreamController<AllProductEvent>();

  Stream<AllProductEvent> get _events => _event.stream;

  void addEvent(AllProductEvent event) {
    _event.sink.add(event);
  }

  final _state = BehaviorSubject<AllProductState>();

  Stream<AllProductState> get state => _state.stream;

  void _setState(AllProductState state) => _state.sink.add(state);

  AllProductState get initialState => AllProductLoadingState();

  AllProductState get lastState => _state.value ?? initialState;

  Future<void> _mapEventToState(AllProductEvent event) async {
    if (event is LoadAllProductEvent) {
      return _loadData(event.category);
    }
  }

  Future<void> _loadData(String category) async {
    _setState(AllProductLoadingState());
    final data = await _controller.getProductByCategory(category);
    if (data is ProductResponse) {
      _setState(AllProductLoadedState(product: data.data ?? []));
    } else {
      _setState(AllProductLoadedExceptionState(message: data.toString()));
    }
  }

  void dispose() {
    _eventSubscription.cancel();
    _state.close();
    _event.close();
  }
}

class AllProductEvent {}

class LoadAllProductEvent extends AllProductEvent {
  String category;

  LoadAllProductEvent({this.category});
}

class AllProductState {}

class AllProductLoadingState extends AllProductState {}

class AllProductLoadedState extends AllProductState {
  final List<Product> product;

  AllProductLoadedState({this.product});
}

class AllProductLoadedExceptionState extends AllProductState {
  final String message;

  AllProductLoadedExceptionState({this.message});
}
