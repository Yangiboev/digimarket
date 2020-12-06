import 'package:dmp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'BasePage.dart';

class WebViewPage extends BasePage {
  WebViewPage({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends BasePageState<WebViewPage> {
  double progress = 0;
  final flutterWebViewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onUrlChanged.listen((String url) async {
      print(url);
      if ("http://dev.goodzone.uz/account/orders" == url ||
          url ==
              "http://dev.goodzone.uz/account/orders?payment_status=-10000") {
        Navigator.of(context).pop();
      } else if (url == "Payme checkout" ||
          url.contains(
              "http://dev.goodzone.uz/account/orders?payment_status=")) {
      }
    });
    flutterWebViewPlugin.onProgressChanged.listen((event) {
      setState(() {
        progress = event;
      });
    });
  }

  @override
  void dispose() {
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(widget.title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17)),
      ),
      body: Container(
        child: Column(
          children: [
            (progress != 1.0)
                ? LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(clrAssets))
                : Container(),
            Expanded(
              child: Container(
                child: WebviewScaffold(
                  url: widget.url,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
