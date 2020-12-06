import 'package:dmp/utils/constants.dart';
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:translator/translator.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  final translator = GoogleTranslator();

  final Widget logo = SvgPicture.asset(
    'assets/svg/logo.svg',
    semanticsLabel: 'DMP Logo',
    width: 70,
    color: clrAssets,
    height: 30,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showCustomFlash(
    String message, {
    FlashPosition position = FlashPosition.top,
    FlashStyle style = FlashStyle.floating,
    Alignment alignment,
  }) {
    showFlash(
      context: context,
      duration: Duration(milliseconds: 3500),
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: Color(0xFFd50000),
          borderRadius: BorderRadius.circular(8.0),
          borderColor: Colors.transparent,
          position: position,
          style: style,
          margin: EdgeInsets.all(12),
          alignment: alignment,
          enableDrag: false,
          onTap: () => controller.dismiss(),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              message,
              style: styDefaultTextStyle.copyWith(
                  fontSize: 17, color: clrWhite, fontStyle: FontStyle.normal),
            ),
          ),
        );
      },
    );
  }
}

Widget loader = Center(
  child: CircularProgressIndicator(
  ),
);


