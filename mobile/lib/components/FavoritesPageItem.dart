import 'package:animations/animations.dart';
import 'package:dmp/doman/bloc/AllProductBloc.dart';
import 'package:dmp/doman/bloc/ProductBloc.dart';
import 'package:dmp/doman/local/favourites_db.dart';
import 'package:dmp/model/ProductResponse.dart';
import 'package:dmp/ui/ProductPageData.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class FavoritePageItem extends StatelessWidget {
  FavoritePageItem(
      {this.favorite,
      this.deleteFavourite,
      this.imageSize});

  final Favourite favorite;
  final Function deleteFavourite;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    final fmf = FlutterMoneyFormatter(
      amount: double.parse('0'),
      settings: MoneyFormatterSettings(thousandSeparator: ' '),
    ).output;
    int discount = 0;
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: OpenContainer(
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        transitionType: ContainerTransitionType.fade,
        transitionDuration: duration,
        openBuilder: (context, d) {
          Product product = Product(
              name: favorite.product_name,
              image: favorite.product_image,
            categoryId: favorite.category_type,
            description: '',
            id: favorite.product_id
          );
          Provider.of<ProductBloc>(context, listen: false).addEvent(LoadProductEvent(id: product.id));
          return ProductPageData(product: product,);
        },
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
                      imageUrl:
                          favorite.product_image ?? 'assets/image/placeholder_cover.jpg',
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Container(
                        width: imageSize,
                        height: imageSize,
                        child: Center(
                          child: Image.asset('assets/image/placeholder_cover.jpg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 4, top: 6),
                      child: Text(
                        favorite.category_type,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: const Color(0xFFABABAB),
                            fontWeight: FontWeight.w400,
                            fontSize: 11),
                      ),
                    ),
                    Container(
                      height: 44,
                      padding: const EdgeInsets.only(
                          top: 4, bottom: 6, left: 12, right: 4),
                      child: Text(
                        favorite.product_name,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                    /*Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 4, bottom: 8),
                      child: Text(
                        "${fmf.withoutFractionDigits} uzs",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: const Color(0xFFFF0006),
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
                          bottomRight: Radius.circular(4),
                        ),
                        color: Color(0xFFFF0006),
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
                  child: IconButton(
                    highlightColor: Colors.white,
                    splashColor: Colors.white,
                    onPressed: () {
                      deleteFavourite(favorite);
                    },
                    icon: CircleAvatar(
                        radius: 14,
                        backgroundColor: const Color(0xFFF4F4F4),
                        child: Icon(Icons.favorite,
                            size: 20, color: const Color(0xFFFF0006))),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
