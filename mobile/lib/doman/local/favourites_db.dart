import 'package:moor_flutter/moor_flutter.dart';

part 'favourites_db.g.dart';

class Favourites extends Table {

  TextColumn get product_id => text()();

  TextColumn get product_name => text()();

  TextColumn get product_image => text()();

  TextColumn get category_type => text()();


  @override
  Set<Column> get primaryKey =>{product_id};
}

@UseMoor(tables: [Favourites])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'favourite.db', logStatements: true));

  @override
  int get schemaVersion => 1;


  Stream<List<Favourite>> watchAllFavourites() => select(favourites).watch();

  Future<List<Favourite>> getAllFavourites() => select(favourites).get();

  Future insertFavourite(Favourite favourite) => into(favourites).insert(favourite);
  Future updateFavourite(Favourite favourite) => update(favourites).replace(favourite);
  Future deleteFavourite(Favourite favourite) => delete(favourites).delete(favourite);


  Future deleteFavouriteWithProductId(Favourite favourite) {
    return (delete(favourites)..where((t) => t.product_id.equals(favourite.product_id))).go();
  }

  Future<bool> check(String product_id)async{
    final List<Favourite> favouritesList = await select(favourites).get();
    favouritesList.forEach((element) {
      if(element.product_id == product_id){
        return true;
      }
    });
    return false;
  }

  Future deleteAll() => delete(_favourites).go();

}

