class BrandResponse {
  List<Brands> brands;
  String count;

  BrandResponse({this.brands, this.count});

  BrandResponse.fromJson(Map<String, dynamic> json) {
    if (json['brands'] != null) {
      brands = new List<Brands>();
      json['brands'].forEach((v) {
        brands.add(new Brands.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brands != null) {
      data['brands'] = this.brands.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Brands {
  bool active;
  String createdAt;
  String description;
  String id;
  String image;
  String name;
  String previewText;
  String slug;
  String updatedAt;

  Brands(
      {this.active,
        this.createdAt,
        this.description,
        this.id,
        this.image,
        this.name,
        this.previewText,
        this.slug,
        this.updatedAt});

  Brands.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    createdAt = json['created_at'];
    description = json['description'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    previewText = json['preview_text'];
    slug = json['slug'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['description'] = this.description;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['preview_text'] = this.previewText;
    data['slug'] = this.slug;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
