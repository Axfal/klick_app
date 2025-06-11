import 'package:flutter/material.dart';

class HomeBrandProvider with ChangeNotifier {
  final List<Map<String, String>> _brands = [
    {'imagePath': 'assets/images/product3.png', 'brandName': 'Watches'},
    {'imagePath': 'assets/images/product1.png', 'brandName': 'Men Fashion'},
    {'imagePath': 'assets/images/product1.png', 'brandName': 'Jackets'},
    {'imagePath': 'assets/images/product1.png', 'brandName': 'Foot wear'},
    {'imagePath': 'assets/images/product2.png', 'brandName': 'Health & beauty'},
    {
      'imagePath': 'assets/images/product1.png',
      'brandName': 'Lifestyle & Fashion',
    },
  ];

  List<Map<String, String>> get brands => _brands;
}
