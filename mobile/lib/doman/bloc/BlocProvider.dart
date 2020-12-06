import 'package:flutter/material.dart';

import 'FavouritesBloc.dart';

class BlocProvider extends InheritedWidget {
  final FavoriteBloc bloc;

  BlocProvider({@required this.bloc, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(BlocProvider oldWidget) {
    return oldWidget.bloc != bloc;
  }

  static FavoriteBloc provideBloc(BuildContext ctx) =>
      // ignore: deprecated_member_use
  (ctx.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bloc;
}