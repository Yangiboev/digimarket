import 'package:dmp/api/yandexHelper.dart';
import 'package:dmp/components/round_icon_button.dart';
import 'package:dmp/model/map/DirectionResponse.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'BasePage.dart';

const apiKey = 'AIzaSyC-JKHHk8pyMAK_Rc6OIrzSxlcxX4O4ICU';
const googleKey =
    'https://maps.googleapis.com/maps/api/directions/json?origin=';

class ShopMapPage extends BasePage {
  ShopMapPage({Key key, this.myPoint, this.showPoint}) : super(key: key);

  final Point myPoint;
  final Point showPoint;

  @override
  _ShopMapPageState createState() => _ShopMapPageState();
}

class _ShopMapPageState extends BasePageState<ShopMapPage> {
  YandexMapController controller;
  final Polyline polyline = Polyline(
    coordinates: <Point>[],
    strokeColor: Colors.orange[700],
    strokeWidth: 7.5,
    // <- default value 5.0, this will be a little bold
    outlineColor: Colors.yellow[200],
    outlineWidth: 2.0,
  );
  String directionPos = 'Driving';

  getDirections(String mode) async {
    YandexHelper networkHelper = YandexHelper(
        '$googleKey${widget.myPoint.latitude},${widget.myPoint.longitude}&destination=${widget.showPoint.latitude},${widget.showPoint.longitude}&mode=$mode&key=$apiKey');
    final response = await networkHelper.getData();
    DirectionResponse direction = DirectionResponse.fromJson(response);
    /* if (direction.routes.isNotEmpty &&
        direction.routes[0].legs.isNotEmpty &&
        direction.routes[0].legs[0].steps.isNotEmpty) {
      await controller.removePolyline(polyline);
      polyline.coordinates.clear();
      direction.routes[0].legs[0].steps.forEach((element) {
        polyline.coordinates.add(Point(
            latitude: element.startLocation.lat,
            longitude: element.startLocation.lng));
        polyline.coordinates.add(Point(
            latitude: element.endLocation.lat,
            longitude: element.endLocation.lng));
      });
    }
    await controller.addPolyline(polyline);*/
    if (direction.routes.isNotEmpty) {
      var decode = decodePoly(direction.routes[0].overviewPolyline.points);
      var points = convertToPoint(decode);
      polyline.coordinates.addAll(points);
      await controller.addPolyline(polyline);
    }
  }

  static List decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
    // repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negative then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    return lList;
  }

  static List<Point> convertToPoint(List points) {
    List<Point> result = <Point>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(Point(latitude: points[i - 1], longitude: points[i]));
      }
    }
    return result;
  }

  addPlaceMarker() async {
    await controller.addPlacemark(Placemark(
        point: widget.showPoint,
        opacity: 1,
        scale: 2,
        iconName: 'assets/image/shop_icon.png',
        onTap: () {
          _showMessage(context, Text('10 Km'));
        }));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(children: <Widget>[
          YandexMap(
            onMapCreated: (YandexMapController yandexMapController) async {
              controller = yandexMapController;
              await controller.move(
                point: widget.showPoint,
                zoom: 20,
                animation: const MapAnimation(smooth: true, duration: 2.0),
              );
              await addPlaceMarker();
              await controller.showUserLayer(
                  iconName: 'assets/image/user.png',
                  arrowName: 'assets/image/arrow.png',
                  accuracyCircleFillColor: Colors.red.withOpacity(0.5));
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 32, left: 16),
              child: RoundIconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                size: 40,
                color: Colors.white,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(bottom: 40, right: 16),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                color: Colors.white,
                child: Container(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    onPressed: () async {
                      await controller.zoomIn();
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(top: 40, right: 16),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                color: Colors.white,
                child: Container(
                  width: 40,
                  height: 40,
                  child: IconButton(
                    onPressed: () async {
                      await controller.zoomOut();
                    },
                    icon: Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.only(bottom: 32, right: 16),
              child: FloatingActionButton(
                heroTag: "btn3",
                elevation: 2,
                backgroundColor: Colors.white,
                onPressed: () async {
                  await controller.showUserLayer(
                      iconName: 'assets/image/user.png',
                      arrowName: 'assets/image/arrow.png',
                      accuracyCircleFillColor: Colors.red.withOpacity(0.5));
                  await controller.move(
                    point: widget.myPoint,
                    zoom: 20,
                    animation: const MapAnimation(smooth: true, duration: 2.0),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Icon(
                    Icons.near_me,
                    color: clrAssets,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(bottom: 32, left: 16),
              child: FloatingActionButton(
                heroTag: "btn4",
                elevation: 2,
                backgroundColor: Colors.white,
                onPressed: () {
                  getDirections(directionPos);
                },
                child: Icon(
                  Icons.directions,
                  color: clrAssets,
                  size: 32,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _showMessage(BuildContext context, Text text) {
    final ScaffoldState scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: text,
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

/*directionModalBottomSheet(context) {
    showModalBottomSheet(
        clipBehavior: Clip.antiAlias,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16)),
        ),
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              height: 200.0,
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: '3',
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.green,
                            ),
                            children: [
                              TextSpan(
                                text: '  min',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.green,
                                ),
                              ),
                              TextSpan(
                                text: '  (2.1 km)',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: direction.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return directionDetailCheap(
                              direction[index].icon,
                              direction[index].text,
                              direction[index].mode,
                              state);
                        }),
                  ),
                ],
              ),
            );
          });
        });
  }

  Widget directionDetailCheap(
      IconData iconData, String label, String mode, StateSetter updateState) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: RawChip(
        label: Text(
          label,
        ),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        onPressed: () {
          updateState(() {
            directionPos = mode;
            getDirections(directionPos);
          });
        },
        labelStyle: TextStyle(
          color: mode == directionPos ? Colors.white : Colors.black,
          fontSize: 16,
        ),
        backgroundColor: mode == directionPos ? Colors.black : Colors.grey[500],
        avatar: Icon(
          iconData,
          size: 16,
          color: mode == directionPos ? Colors.white : Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }*/
}
