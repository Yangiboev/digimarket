import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidgetForHorizontalScroll extends StatelessWidget {
  ShimmerWidgetForHorizontalScroll({@required this.height, @required this.width});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey[200],
          highlightColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Container(
              width: width,
              child: Material(
                borderRadius: BorderRadius.circular(4),
                clipBehavior: Clip.hardEdge,
                elevation: 4,
                shadowColor: Color(0xCC000000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
