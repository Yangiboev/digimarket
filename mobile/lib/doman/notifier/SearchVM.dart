import 'package:dmp/model/ProductResponse.dart';
import 'package:flutter/foundation.dart';

class SearchNotifier with ChangeNotifier {
  List<Product> _searchItems = [];

  List<Product> get list => _searchItems;

  void addList(List<Product> movies) {
    _searchItems.clear();
    _searchItems.addAll(movies);
    notifyListeners();
  }
}
