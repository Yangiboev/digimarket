import 'dart:async';
import 'package:dmp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'BasePage.dart';
import 'MainPage.dart';

class Splash extends BasePage {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends BasePageState<Splash> {
  final Widget logo = SvgPicture.asset(
    'assets/svg/logo.svg',
    semanticsLabel: 'DMP Logo',
    width: 80,
    color: clrAssets,
    height: 200,
  );

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => MainPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clrWhite,
      body: Padding(
        padding: const EdgeInsets.all(64),
        child: Center(
          child: logo,
        ),
      ),
    );
  }
}
