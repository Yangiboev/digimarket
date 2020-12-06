class ProductDetailResponse {
  Category category;
  String description;
  String id;
  String image;
  String name;
  List<Prices> prices;

  ProductDetailResponse(
      {this.category,
        this.description,
        this.id,
        this.image,
        this.name,
        this.prices});

  ProductDetailResponse.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
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
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
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

class Category {
  String id;
  String name;
  String parentId;

  Category({this.id, this.name, this.parentId});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parent_id'] = this.parentId;
    return data;
  }
}

class Prices {
  int price;
  String shop;
  String url;

  Prices({this.price, this.shop, this.url});

  Prices.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    shop = json['shop'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['shop'] = this.shop;
    data['url'] = this.url;
    return data;
  }
}
