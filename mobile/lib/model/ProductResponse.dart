import 'ProductDetailResponse.dart';

class ProductResponse {
  List<Product> data;
  bool success;

  ProductResponse({this.data, this.success});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Product>();
      json['data'].forEach((v) {
        data.add(new Product.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Product {
  String categoryId;
  String description;
  String id;
  String image;
  String name;
  List<Prices> prices;

  Product({this.categoryId, this.description, this.id, this.image, this.name, this.prices});

  Product.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    description = json['description'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    if (json['prices'] != null) {
      prices = new List<Prices>();
      json['prices'].forEach((v) {
        prices.add(new Prices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    if (this.prices != null) {
      data['prices'] = this.prices.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
