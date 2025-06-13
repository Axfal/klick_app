class ProductDetailsModel {
  bool? success;
  List<Product>? products;

  ProductDetailsModel({this.success, this.products});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['products'] != null) {
      products = List<Product>.from(
        json['products'].map((x) => Product.fromJson(x)),
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'products': products?.map((x) => x.toJson()).toList(),
    };
  }
}

class Product {
  int? productId;
  String? productName;
  String? brandName;
  String? price;
  String? discountPrice;
  String? description;
  int? stock;
  List<String>? categories;
  List<String>? images;
  List<Variation>? variations;
  List<Tag>? tags;

  Product({
    this.productId,
    this.productName,
    this.brandName,
    this.price,
    this.discountPrice,
    this.description,
    this.stock,
    this.categories,
    this.images,
    this.variations,
    this.tags,
  });

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    brandName = json['brand_name'];
    price = json['price'];
    discountPrice = json['discount_price'];
    description = json['description'];
    stock = json['stock'];
    categories = List<String>.from(json['categories'] ?? []);
    images = List<String>.from(json['images'] ?? []);
    if (json['variations'] != null) {
      variations = List<Variation>.from(
        json['variations'].map((x) => Variation.fromJson(x)),
      );
    }
    if (json['tags'] != null) {
      tags = List<Tag>.from(
        json['tags'].map((x) => Tag.fromJson(x)),
      );
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_name': productName,
      'brand_name': brandName,
      'price': price,
      'discount_price': discountPrice,
      'description': description,
      'stock': stock,
      'categories': categories,
      'images': images,
      'variations': variations?.map((x) => x.toJson()).toList(),
      'tags': tags?.map((x) => x.toJson()).toList(),
    };
  }
}

class Variation {
  int? variationId;
  String? variationName;
  String? variationValue;
  String? price;
  int? stock;
  String? imageUrl;

  Variation({
    this.variationId,
    this.variationName,
    this.variationValue,
    this.price,
    this.stock,
    this.imageUrl,
  });

  Variation.fromJson(Map<String, dynamic> json) {
    variationId = json['variation_id'];
    variationName = json['variation_name'];
    variationValue = json['variation_value'];
    price = json['price'];
    stock = json['stock'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'variation_id': variationId,
      'variation_name': variationName,
      'variation_value': variationValue,
      'price': price,
      'stock': stock,
      'image_url': imageUrl,
    };
  }
}

class Tag {
  int? tagId;
  String? tagName;

  Tag({this.tagId, this.tagName});

  Tag.fromJson(Map<String, dynamic> json) {
    tagId = json['tag_id'];
    tagName = json['tag_name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'tag_id': tagId,
      'tag_name': tagName,
    };
  }
}
