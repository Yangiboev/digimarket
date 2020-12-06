import 'dart:io';
import 'dart:math';
import 'package:dmp/animation/fadeAnimation.dart';
import 'package:dmp/model/Shops.dart';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import 'BasePage.dart';
import 'PermissionLocationPage.dart';

class ShopDescriptionPage extends BasePage {
  final Shops shop;

  ShopDescriptionPage({this.shop});

  @override
  _ShopDescriptionPageState createState() => _ShopDescriptionPageState();
}

class _ShopDescriptionPageState extends BasePageState<ShopDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clrBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.shop.name.replaceAll('GOODZONE', ''),
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: Colors.transparent,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 128),
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Hero(
                        tag: widget.shop.name,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: widget.shop.image,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              width: double.infinity,
                              height: 200,
                              child: Center(
                                child:
                                    Image.asset('assets/image/placeholder_cover.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      FadeAnimation(
                        1,
                        Row(
                          children: [
                            Transform.rotate(
                              angle: 40 * pi / 180,
                              child: Icon(
                                Icons.navigation,
                                color: clrAssets,
                                size: 24,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Html(
                                defaultTextStyle: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                                data: widget.shop.address,
                                customRender: (node, children) {
                                  return Column(children: children);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      FadeAnimation(
                        1.2,
                        descriptionText(
                            Icon(
                              Icons.phone,
                              color: clrAssets,
                            ),
                            widget.shop.phone),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      FadeAnimation(
                        1.3,
                        descriptionText(
                            Icon(
                              Icons.today,
                              color: clrAssets,
                            ),
                            widget.shop.workingHours),
                      ),
                      SizedBox(
                        height: 72,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                  bottom: 16,
                  left: 16,
                  right: 17),
              height: 56,
              width: double.infinity,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => PermissionLocationPage(
                                openShopMap: true,
                                lat: widget.shop.latLng.lat ?? 41.311151,
                                lng: widget.shop.latLng.long ?? 69.279687,
                              )));
                },
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: clrAssets,
                      ),
                      SizedBox(width: 12),
                      Text("Show Map",
                          style: TextStyle(
                            color: clrAssets,
                              fontSize: 17, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                color: clrWhite,
                textColor: clrAssets,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Color(0xFFF9F9F9))),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                  left: 16, right: 16, bottom: 80),
              height: 56,
              width: double.infinity,
              child: FlatButton(
                onPressed: () {
                  if (Platform.isAndroid) {
                    launch("tel:${widget.shop.phone.split(", ")[0]}");
                  } else {
                    launch(
                        "tel:${widget.shop.phone.split(", ")[0].replaceAll(' ', '').replaceAll('+998', '')}");
                  }
                },
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      SizedBox(width: 12),
                      Text('Call',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                color: clrAssets,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.red)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget descriptionText(Icon icon, String text) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  Widget descriptionTextWithHtml(Icon icon, String text) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Html(
            defaultTextStyle: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            data: text,
            customRender: (node, children) {
              return Column(children: children);
            },
          ),
          /*Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),
          ),*/
        ),
      ],
    );
  }
}
