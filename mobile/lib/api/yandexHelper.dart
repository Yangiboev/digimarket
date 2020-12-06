import 'dart:convert';

import 'package:http/http.dart';

class YandexHelper {
  YandexHelper(this.url);

  final String url;

  Future getData() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      return decodeData;
    } else {
      print(response.statusCode);
    }
  }
}
