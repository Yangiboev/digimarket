import 'dart:async';
import 'package:dmp/doman/controller/Controller.dart';
import 'package:dmp/model/BannerResponse.dart';
import 'package:dmp/model/ProductResponse.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  Controller _controller = Controller();
  StreamSubscription _eventSubscription;

  HomeBloc() {
    _eventSubscription = _events.listen(_mapEventToState);
  }

  final _event = StreamController<HomeEvent>();

  Stream<HomeEvent> get _events => _event.stream;

  void addEvent(HomeEvent event) {
    _event.sink.add(event);
  }

  final _state = BehaviorSubject<HomeState>();

  Stream<HomeState> get state => _state.stream;

  void _setState(HomeState state) => _state.sink.add(state);

  HomeState get initialState => HomeLoadingState();

  HomeState get lastState => _state.value ?? initialState;

  Future<void> _mapEventToState(HomeEvent event) async {
    if (event is LoadHomeEvent) {
      return _loadData();
    }else if (event is LoadHomeBannersEvent) {
      return _loadDataBanners();
    }
  }

  Future<void> _loadDataBanners() async {
    _setState(HomeLoadingState());
    final data = await _controller.getBanners();

    if (data is BannerResponse) {
      if (lastState is HomeLoadedState) {
        final state = lastState as HomeLoadedState;
        _setState(state.copyWith(banners: data.banners??[]));
      } else {
        _setState(HomeLoadedState(product: [], banners: data.banners??[]));
      }
    } else {
      _setState(HomeLoadedExceptionState(message: data.toString()));
    }
  }

  Future<void> _loadData() async {

    final data = await _controller.getHomeData();

    if (data is ProductResponse) {
      if (lastState is HomeLoadedState) {
        final state = lastState as HomeLoadedState;
        _setState(state.copyWith(product: data.data??[]));
      } else {
        _setState(HomeLoadedState(product: data.data, banners: []));
      }
    } else {
      _setState(HomeLoadedExceptionState(message: data.toString()));
    }
  }

  void dispose() {
    _eventSubscription.cancel();
    _state.close();
    _event.close();
  }
}

class HomeEvent {}

class LoadHomeEvent extends HomeEvent {}
class LoadHomeBannersEvent extends HomeEvent {}

class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<Banners> banners;
  final List<Product> product;
  final String errorBanners;
  final String errorProduct;
  HomeLoadedState({this.errorBanners, this.errorProduct, this.banners, this.product});

  HomeLoadedState copyWith({
    List<Banners> banners,
    List<Product> product,
    String errorBanners,
    String errorProduct,
  }) {
    return HomeLoadedState(
      banners: banners ?? this.banners,
      product: product ?? this.product,
      errorBanners: errorBanners ?? this.errorBanners,
      errorProduct : errorProduct ?? this.errorProduct,
    );
  }
}

class HomeLoadedExceptionState extends HomeState {
  final String message;

  HomeLoadedExceptionState({this.message});
}
