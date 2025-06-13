class CategoriesModel {
  bool? success;
  List<Categories>? categories;

  CategoriesModel({this.success, this.categories});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  int? parentId;
  String? categoryName;
  String? categoryIcon;
  List<Subcategories>? subcategories;

  Categories({
    this.id,
    this.parentId,
    this.categoryName,
    this.categoryIcon,
    this.subcategories,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    categoryName = json['category_name'];
    categoryIcon = json['category_icon'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['category_name'] = categoryName;
    data['category_icon'] = categoryIcon;
    if (subcategories != null) {
      data['subcategories'] =
          subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategories {
  int? id;
  int? parentId;
  String? categoryName;
  String? categoryIcon;
  List<Subcategories>? subcategories;

  Subcategories({
    this.id,
    this.parentId,
    this.categoryName,
    this.categoryIcon,
    this.subcategories,
  });

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    categoryName = json['category_name'];
    categoryIcon = json['category_icon'];
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['category_name'] = categoryName;
    data['category_icon'] = categoryIcon;
    if (subcategories != null) {
      data['subcategories'] =
          subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
