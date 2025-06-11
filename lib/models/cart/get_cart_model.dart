class GetCartModel {
  bool? success;
  List<CartModel>? cart;

  GetCartModel({this.success, this.cart});

  GetCartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['cart'] != null) {
      cart = <CartModel>[];
      json['cart'].forEach((v) {
        cart!.add(CartModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (cart != null) {
      data['cart'] = cart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartModel {
  int? id;
  String? userId;
  int? productId;
  int? variationId;
  int? quantity;
  String? discountPrice;
  String? price;
  String? totalPrice;
  String? productName;
  String? variationName;
  String? variationValue;
  String? imageUrl;

  CartModel(
      {this.id,
        this.userId,
        this.productId,
        this.variationId,
        this.quantity,
        this.discountPrice,
        this.price,
        this.totalPrice,
        this.productName,
        this.variationName,
        this.variationValue,
        this.imageUrl});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    variationId = json['variation_id'];
    quantity = json['quantity'];
    discountPrice = json['discount_price'];
    price = json['price'];
    totalPrice = json['total_price'];
    productName = json['product_name'];
    variationName = json['variation_name'];
    variationValue = json['variation_value'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['variation_id'] = variationId;
    data['quantity'] = quantity;
    data['discount_price'] = discountPrice;
    data['price'] = price;
    data['total_price'] = totalPrice;
    data['product_name'] = productName;
    data['variation_name'] = variationName;
    data['variation_value'] = variationValue;
    data['image_url'] = imageUrl;
    return data;
  }
}
