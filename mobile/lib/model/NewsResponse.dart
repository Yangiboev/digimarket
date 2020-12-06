class NewsResponse {
  String count;
  List<News> news;

  NewsResponse({this.count, this.news});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['news'] != null) {
      news = new List<News>();
      json['news'].forEach((v) {
        news.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  bool active;
  String createdAt;
  String description;
  String formattedDate;
  String fullText;
  String id;
  String imageURL;
  Meta meta;
  String previewImage;
  String slug;
  String title;
  String updatedAt;

  News(
      {this.active,
        this.createdAt,
        this.description,
        this.formattedDate,
        this.fullText,
        this.id,
        this.imageURL,
        this.meta,
        this.previewImage,
        this.slug,
        this.title,
        this.updatedAt});

  News.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    createdAt = json['created_at'];
    description = json['description'];
    formattedDate = json['formatted_date'];
    fullText = json['full_text'];
    id = json['id'];
    imageURL = json['imageURL'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    previewImage = json['preview_image'];
    slug = json['slug'];
    title = json['title'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['description'] = this.description;
    data['formatted_date'] = this.formattedDate;
    data['full_text'] = this.fullText;
    data['id'] = this.id;
    data['imageURL'] = this.imageURL;
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    data['preview_image'] = this.previewImage;
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Meta {
  String description;
  String tags;
  String title;

  Meta({this.description, this.tags, this.title});

  Meta.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    tags = json['tags'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['title'] = this.title;
    return data;
  }
}
