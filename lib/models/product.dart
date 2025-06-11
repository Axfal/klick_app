class Product {
  final String productName;
  final int price;
  final int? discountedPercent;
  final double rating;
  final int ratingCount;
  final int soldCount;
  final bool showFreeDelivery;
  final bool showLimitedTimeOffer;
  final String? sku;
  final String? deliveryTime; // Add this if not present

  Product({
    required this.productName,
    required this.price,
    this.discountedPercent,
    required this.rating,
    required this.ratingCount,
    required this.soldCount,
    required this.showFreeDelivery,
    required this.showLimitedTimeOffer,
    this.sku,
    this.deliveryTime,
  });
}
