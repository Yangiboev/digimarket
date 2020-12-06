import 'package:dmp/model/ProductResponse.dart';
import 'package:flutter/material.dart';
import 'ShimmerWidgetForHorizontalScroll.dart';
import 'home_item_popular.dart';

class HorizontalPopularController extends StatelessWidget {
  HorizontalPopularController({Key key, this.popularList}) : super(key: key);

  final List<Product> popularList;

  Widget _getWidget() {
    if (popularList.length != 0) {
      return SizedBox(
        height: 256,
        child: ListView.builder(
            itemCount: popularList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 2),
            itemBuilder: (BuildContext context, int position) {
              return PopularContainerItem(popular: popularList[position]);
            }),
      );
    } else {
      return ShimmerWidgetForHorizontalScroll(
        height: 256,
        width: 168,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getWidget();
  }
}
