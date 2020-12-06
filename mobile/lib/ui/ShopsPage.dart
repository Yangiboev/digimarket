import 'package:dmp/components/ShopItem.dart';
import 'package:dmp/model/Shops.dart';
import 'package:dmp/ui/BasePage.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/material.dart';

class ShopsPage extends BasePage {
  @override
  _ShopsPageState createState() => _ShopsPageState();
}

class _ShopsPageState extends BasePageState<ShopsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) =>
            Divider(
              color: clrTextSecondary,
              height: .4,
            ),
        itemCount: shops.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int position) {
          return ShopItem(shops[position]);
        });
  }
}

