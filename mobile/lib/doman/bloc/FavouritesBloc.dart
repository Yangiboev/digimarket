import 'dart:async';

import 'package:dmp/doman/local/favourites_db.dart';

import 'Bloc.dart';

class FavoriteBloc implements Bloc {

  final AppDatabase appDatabase;
  List<Favourite> list = [];
  Stream<List<Favourite>> _watchFavourites;

  FavoriteBloc() : appDatabase = AppDatabase(){
    _watchFavourites = appDatabase.watchAllFavourites();
  }

  Future<List<Favourite>> getAllFavourites() async{
    return await appDatabase.getAllFavourites();
  }

  Stream<List<Favourite>> get watchAllFavourites => _watchFavourites;
  
  void insertFavourite(Favourite favourite){
    appDatabase.insertFavourite(favourite);
  }
  
  void updateFavourite(Favourite favourite){
    appDatabase.updateFavourite(favourite);
  }
  void deleteFavourite(Favourite favourite){
    appDatabase.deleteFavourite(favourite);
  }
  void deleteAllFavourites(){
    appDatabase.deleteAll();
  }

  Future<bool> check(String productId) async{
   return await appDatabase.check(productId);
  }

  @override
  void dispose() {
    appDatabase.close();
  }
}