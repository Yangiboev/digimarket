import 'package:dmp/doman/bloc/BlocProvider.dart';
import 'package:dmp/doman/bloc/CategoryBloc.dart';
import 'package:dmp/doman/bloc/HomeBloc.dart';
import 'package:dmp/doman/bloc/NewsBloc.dart';
import 'package:dmp/doman/bloc/ProductBloc.dart';
import 'package:dmp/doman/bloc/ProductBloc.dart';
import 'package:dmp/doman/notifier/SearchVM.dart';
import 'package:dmp/ui/Splash.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:provider/provider.dart';
import 'api/ApiClient.dart';
import 'doman/bloc/AllProductBloc.dart';
import 'doman/bloc/FavouritesBloc.dart';
import 'doman/notifier/MainVM.dart';

void main() {
  runApp(MyAppPage());
}

/*
Alice alice = Alice(
    showNotification: true,
    navigatorKey: GlobalKey(debugLabel: "DMP"),
    showInspectorOnShake: true);
*/

get getDio {
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(responseBody: true));
  // dio.interceptors.add(alice.getDioInterceptor());
  return dio;
}

ApiClient getApiClient({String baseUrl = 'https://api.goodzone.uz/v1'}) {
  return ApiClient(getDio, CancelToken(), baseUrl);
}


class MyAppPage extends StatefulWidget {
  MyAppPage({Key key}) : super(key: key);

  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  FavoriteBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = FavoriteBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: bloc,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainNotifier()),
          ChangeNotifierProvider(create: (_) => SearchNotifier()),
          Provider(
            create: (_) => HomeBloc(),
            dispose: (_, HomeBloc bloc) => bloc.dispose(),
          ), Provider(
            create: (_) => ProductBloc(),
            dispose: (_, ProductBloc bloc) => bloc.dispose(),
          ),  Provider(
            create: (_) => NewsBloc(),
            dispose: (_, NewsBloc bloc) => bloc.dispose(),
          ), Provider(
            create: (_) => AllProductBloc(),
            dispose: (_, AllProductBloc bloc) => bloc.dispose(),
          ),
          Provider(
            create: (_) => CategoryBloc(),
            dispose: (_, CategoryBloc bloc) => bloc.dispose(),
          ),
        ],
        child: MaterialApp(
          // navigatorKey: alice.getNavigatorKey(),
          home: Splash(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
