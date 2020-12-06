class BannerResponse {
  List<Banners> banners;
  String count;

  BannerResponse({this.banners, this.count});

  BannerResponse.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = new List<Banners>();
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Banners {
  String id;
  String title;
  Position position;
  bool active;
  String image;
  String url;
  String description;
  String createdAt;
  String updatedAt;

  Banners(
      {this.id,
        this.title,
        this.position,
        this.active,
        this.image,
        this.url,
        this.description,
        this.createdAt,
        this.updatedAt});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
    active = json['active'];
    image = json['image'];
    url = json['url'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.position != null) {
      data['position'] = this.position.toJson();
    }
    data['active'] = this.active;
    data['image'] = this.image;
    data['url'] = this.url;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Position {
  String id;
  String title;
  String slug;
  bool active;
  String size;
  String description;
  String createdAt;
  String updatedAt;

  Position(
      {this.id,
        this.title,
        this.slug,
        this.active,
        this.size,
        this.description,
        this.createdAt,
        this.updatedAt});

  Position.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    active = json['active'];
    size = json['size'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['active'] = this.active;
    data['size'] = this.size;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
