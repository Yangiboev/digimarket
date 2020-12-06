import 'package:animations/animations.dart';
import 'package:dmp/doman/bloc/BlocProvider.dart';
import 'package:dmp/doman/bloc/FavouritesBloc.dart';
import 'package:dmp/doman/bloc/ProductBloc.dart';
import 'package:dmp/doman/local/favourites_db.dart';
import 'package:dmp/model/ProductResponse.dart';
import 'package:dmp/ui/ProductPageData.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class CategoryProductItem extends StatefulWidget {
  CategoryProductItem({this.product, this.imageSize});

  final Product product;
  final double imageSize;

  @override
  _CategoryProductItemState createState() => _CategoryProductItemState();
}

class _CategoryProductItemState extends State<CategoryProductItem> {
  Favourite favorite;
  int discount = 0;
  FavoriteBloc get bloc => BlocProvider.provideBloc(context);

  @override
  void initState() {
    super.initState();
    favorite = Favourite(
       product_id: widget.product.id,
      product_image: widget.product.image,
      product_name: widget.product.name,
       category_type :widget.product.categoryId,);
  }

  @override
  Widget build(BuildContext context) {
    final fmf = FlutterMoneyFormatter(
      amount: double.parse('0'),
      settings: MoneyFormatterSettings(thousandSeparator: ' '),
    ).output;
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: OpenContainer(
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        openBuilder: (context, _) {
          Provider.of<ProductBloc>(context, listen: false).addEvent(LoadProductEvent(id: widget.product.id));
          return ProductPageData(product: widget.product,);
        },
        transitionDuration: duration,
        closedBuilder: (context, openContainer) {
          return GestureDetector(
            onTap: openContainer,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.product.image ??
                          'assets/image/placeholder_cover.jpg',
                      width: widget.imageSize,
                      height: widget.imageSize,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Container(
                        width: widget.imageSize,
                        height: widget.imageSize,
                        child: Center(
                          child: Image.asset('assets/image/placeholder_cover.jpg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 6, left: 12, right: 4),
                      child: Text(
                        '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: const Color(0xFFABABAB),
                            fontWeight: FontWeight.normal,
                            fontSize: 11),
                      ),
                    ),
                    Container(
                      height: 40,
                      padding:
                          const EdgeInsets.only(top: 4, left: 12, right: 4),
                      child: SizedBox(
                        height: 35,
                        child: Text(
                          widget.product.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    /*Padding(
                      padding: const EdgeInsets.only(
                          top: 6, left: 12, right: 4, bottom: 8),
                      child: Text(
                        "${fmf.withoutFractionDigits} uzs",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: clrAssets,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    )*/
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
                        color: clrAssets,
                      ),
                      child: Center(
                        child: Text(
                          "-$discount%",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -6,
                  right: -6,
                  child: StreamBuilder(
                    stream: bloc.watchAllFavourites,
                    builder: (context, snapshot){
                      bool isActive = false;
                      if (snapshot.data != null){
                        snapshot.data.forEach((element) {
                          if (element.product_id == favorite.product_id) {
                            isActive = true;
                          }
                        });
                      }
                      return IconButton(
                        highlightColor: Colors.white,
                        splashColor: Colors.white,
                        onPressed: () {
                          changeFavorite(favorite, !isActive);
                        },
                        icon: Stack(
                          children: [
                            CircleAvatar(
                                radius: 14,
                                backgroundColor: const Color(0xFFF4F4F4),
                                child: Icon(Icons.favorite,
                                    size: 20,
                                    color: isActive
                                        ? clrAssets
                                        : const Color(0xFFABABAB))),
                          ],
                        ),
                      );
                    },
                  ),
                ),
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
