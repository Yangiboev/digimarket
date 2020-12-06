import 'package:dmp/model/Shops.dart';
import 'package:dmp/ui/ShopDescriptionPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShopItem extends StatelessWidget {
  ShopItem(this.shop);

  final Shops shop;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ShopDescriptionPage(
                  shop: shop,
                )));
      },
      child: Container(
        height: 106,
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: shop.name,
              child: Container(
                height: 80,
                width: 104,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: shop.image??'assets/image/placeholder_cover.jpg',
                    width: 104,
                    height: 80,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      width: 104,
                      height: 80,
                      child: Center(
                        child: Image.asset('assets/image/placeholder_cover.jpg'),
                      ),
                    ),),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          shop.name.replaceAll('GOODZONE ', ''),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                          color: Colors.grey, size: 20,),
                      ],
                    ),
                    Spacer(),
                    Html(
                      defaultTextStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFABABAB),
                        fontWeight: FontWeight.w400,
                      ),
                      data: shop.address,
                      customRender: (node, children) {
                        return Column(children: children);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
