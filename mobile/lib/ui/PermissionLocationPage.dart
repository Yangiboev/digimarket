import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'BasePage.dart';
import 'ShopMapPage.dart';

class PermissionLocationPage extends BasePage {
  final bool openShopMap;
  final double lat;
  final double lng;

  PermissionLocationPage({this.openShopMap, this.lat, this.lng});

  @override
  _PermissionLocationPageState createState() => _PermissionLocationPageState();
}

class _PermissionLocationPageState
    extends BasePageState<PermissionLocationPage> {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  Point myPoint = Point(latitude: 41.311151, longitude: 69.279687);
  StreamSubscription<LocationData> locationSubscription;

  getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    myPoint = Point(
        latitude: _locationData.latitude, longitude: _locationData.longitude);

      locationSubscription = location.onLocationChanged.listen((LocationData currentLocation) {
        setState(() {
          myPoint = Point(
              latitude: currentLocation.latitude,
              longitude: currentLocation.longitude);
        });
      });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  void dispose() {
    super.dispose();
    locationSubscription.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return
      ShopMapPage(
            myPoint: myPoint,
            showPoint: Point(latitude: widget.lat, longitude: widget.lng),
          );
  }
}
