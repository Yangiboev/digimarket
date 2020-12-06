import 'dart:async';
import 'package:dmp/doman/controller/Controller.dart';
import 'package:dmp/model/ProductDetailResponse.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  Controller _controller = Controller();
  StreamSubscription _eventSubscription;

  ProductBloc() {
    _eventSubscription = _events.listen(_mapEventToState);
  }

  final _event = StreamController<ProductEvent>();

  Stream<ProductEvent> get _events => _event.stream;

  void addEvent(ProductEvent event) {
    _event.sink.add(event);
  }

  final _state = BehaviorSubject<ProductState>();

  Stream<ProductState> get state => _state.stream;

  void _setState(ProductState state) => _state.sink.add(state);

  ProductState get initialState => ProductLoadingState();

  ProductState get lastState => _state.value ?? initialState;

  Future<void> _mapEventToState(ProductEvent event) async {
    if (event is LoadProductEvent) {
      return _loadData(event.id);
    }
  }

  Future<void> _loadData(String id) async {
    _setState(ProductLoadingState());
    final data = await _controller.getProduct(id);
    if (data is ProductDetailResponse) {
      _setState(ProductLoadedState(prices: data.prices ?? []));
    } else {
      _setState(ProductLoadedExceptionState(message: data.toString()));
    }
  }

  void dispose() {
    _eventSubscription.cancel();
    _state.close();
    _event.close();
  }
}

class ProductEvent {}

class LoadProductEvent extends ProductEvent {
  final String id;

  LoadProductEvent({this.id});
}

class ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<Prices> prices;

  ProductLoadedState({this.prices});
}

class ProductLoadedExceptionState extends ProductState {
  final String message;

  ProductLoadedExceptionState({this.message});
}
