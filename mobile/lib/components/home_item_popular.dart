import 'package:animations/animations.dart';
import 'package:dmp/doman/bloc/BlocProvider.dart';
import 'package:dmp/doman/bloc/FavouritesBloc.dart';
import 'package:dmp/doman/bloc/ProductBloc.dart';
import 'package:dmp/doman/local/favourites_db.dart';
import 'package:dmp/model/ProductResponse.dart';
import 'package:dmp/ui/ProductPageData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class PopularContainerItem extends StatefulWidget {
  PopularContainerItem({this.popular});

  final Product popular;

  @override
  _PopularContainerItemState createState() => _PopularContainerItemState();
}

class _PopularContainerItemState extends State<PopularContainerItem> {
  FavoriteBloc get bloc => BlocProvider.provideBloc(context);

  Favourite favorite;
  int discount = 0;

  @override
  void initState() {
    super.initState();
    favorite = Favourite(
      product_id: widget.popular.id,
      product_image: widget.popular.image,
      product_name: widget.popular.name,
      category_type :widget.popular.categoryId,);
  }

  @override
  Widget build(BuildContext context) {
    var fmf = FlutterMoneyFormatter(
      amount: double.parse('0'),
      settings: MoneyFormatterSettings(thousandSeparator: ' '),
    ).output;
    return Container(
          width: 154,
          height: 264,
          margin: const EdgeInsets.only(right: 16),
          child: OpenContainer(
            closedShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            transitionDuration: const Duration(milliseconds: 400),
            openBuilder: (context, _) {
              Provider.of<ProductBloc>(context, listen: false).addEvent(LoadProductEvent(id: widget.popular.id));
              return ProductPageData(product: widget.popular,);
            },
            closedBuilder: (context, openContainer) {
              return GestureDetector(
                onTap: openContainer,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CachedNetworkImage(
                          imageUrl: widget.popular.image ??
                              'assets/image/placeholder_cover.jpg',
                          width: 154,
                          height: 154,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => Container(
                            width: 154,
                            height: 154,
                            child: Center(
                              child:
                                  Image.asset('assets/image/placeholder_cover.jpg'),
                            ),
                          ),
                        ),
                        /*Padding(
                          padding:
                              const EdgeInsets.only(left: 12, right: 4, top: 6),
                          child: Text(
                            widget.popular.categoryId ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: const Color(0xFFABABAB),
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          ),
                        ),*/
                        Container(
                          height: 40,
                          padding:
                              const EdgeInsets.only(top: 4, left: 12, right: 4),
                          child: SizedBox(
                            height: 36,
                            child: Text(
                              widget.popular.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        Spacer(),
                        /*Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 4, bottom: 7),
                          child: Text(
                            "${fmf.withoutFractionDigits} uzs",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: const Color(0xFFFF0006),
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),*/
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Visibility(
                        visible: discount > 0,
                        child: Container(
                          width: 32,
                          height: 16,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4),
                                bottomRight: Radius.circular(4)),
                            color: Color(0xFFFF0006),
                          ),
                          child: Center(
                            child: Text(
                              "-$discount%",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                StreamBuilder(
                  stream: bloc.watchAllFavourites,
                  builder: (context, snapshot) {
                    bool isActive = false;
                    if (snapshot.data != null){
                      snapshot.data.forEach((element) {
                        if (element.product_id == favorite.product_id) {
                          isActive = true;
                        }
                      });
                    }
                    return Positioned(
                      top: -6,
                      right: -6,
                      child: IconButton(
                        highlightColor: Colors.white,
                        splashColor: Colors.white,
                        onPressed: () {
                          changeFavorite(favorite, !isActive);
                        },
                        icon: CircleAvatar(
                            radius: 14,
                            backgroundColor: const Color(0xFFF4F4F4),
                            child: Icon(Icons.favorite,
                                size: 20,
                                color: isActive
                                    ? const Color(0xFFFF0006)
                                    : const Color(0xFFABABAB))),
                      ),
                    );
                  },
                )
                  ],
                ),
              );
            },
          ),
        );
  }

  changeFavorite(Favourite favorite, bool isActive) {
    if (isActive) {
      bloc.insertFavourite(favorite);
    } else {
      bloc.deleteFavourite(favorite);
    }
  }
}
