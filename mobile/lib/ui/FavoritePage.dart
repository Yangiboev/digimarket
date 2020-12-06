import 'package:dmp/components/FavoritesPageItem.dart';
import 'package:dmp/doman/bloc/BlocProvider.dart';
import 'package:dmp/doman/bloc/FavouritesBloc.dart';
import 'package:dmp/doman/local/favourites_db.dart';
import 'package:dmp/ui/BasePage.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/material.dart';

class FavoritePage extends BasePage {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends BasePageState<FavoritePage> {
  List<Favourite> favoriteItems = [];
  FavoriteBloc get bloc => BlocProvider.provideBloc(context);

  deleteFavourite(Favourite favorite) {
    bloc.deleteFavourite(favorite);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = (size.width - 48) / 2;
    final double itemHeight = itemWidth + 108;

    return StreamBuilder(
      stream: bloc.watchAllFavourites,
      builder: (context, snapshot){
        favoriteItems = snapshot.data;
        return  favoriteItems!=null&&favoriteItems.length>0
            ? ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            color: Colors.transparent,
            axisDirection: AxisDirection.down,
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.only(left: 16, right: 16),
              crossAxisSpacing: 16,
              shrinkWrap: false,
              physics: BouncingScrollPhysics(),
              childAspectRatio: (itemWidth / itemHeight),
              children: List.generate(favoriteItems.length, (index) {
                return FavoritePageItem(
                  favorite: favoriteItems[index],
                  deleteFavourite: deleteFavourite,
                  imageSize: itemWidth,
                );
              }),
            ),
          ),
        )
            : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/scene_12.png',
                height: 240,
                width: 196,
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
              ),
              Text(
                'No Favorites',
                style: TextStyle(
                    color: clrTextPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        );



      },
    );


  }
}
