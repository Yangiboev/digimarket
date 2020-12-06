class CategoryResponse {
  List<Categories> data;
  bool success;

  CategoryResponse({this.data, this.success});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Categories>();
      json['data'].forEach((v) {
        data.add(new Categories.fromJson(v));
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

class Categories {
  String id;
  String name;
  String parentId;

  Categories({this.id, this.name, this.parentId});

  Categories.fromJson(Map<String, dynamic> json) {
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
