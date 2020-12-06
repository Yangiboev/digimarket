import 'package:dmp/model/ProductResponse.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchItem extends StatelessWidget {
  SearchItem(this.product, this.hideKeyboard);

  final Product product;
  final void Function() hideKeyboard;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        hideKeyboard.call(),
      },
      child: Container(
        height: 96,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 16, bottom: 16, right: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${product.name}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  Spacer(),
                  /*Text(
                    '${FlutterMoneyFormatter(amount: double.parse(product.price.price)).output.withoutFractionDigits} uzs',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFF0006),
                    ),
                  ),*/
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CachedNetworkImage(
                imageUrl: product.image,
                width: 72,
                height: 72,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 72,
                  height: 72,
                  child: Center(
                    child: Image.asset('assets/image/placeholder_cover.jpg'),
                  ),
                ),),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Divider(
                color: clrTextSecondary,
                height: .4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
