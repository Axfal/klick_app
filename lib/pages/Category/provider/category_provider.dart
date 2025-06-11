import 'package:klik_app/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  final List<CategoryModel> _categories = [
    CategoryModel(title: "Always Fresh", image: "assets/images/bread.png"),
    CategoryModel(title: "Grocery Foods", image: "assets/images/food_grocery.png"),
    CategoryModel(title: "Grocery Non-Foods", image: "assets/images/non_food_grocery.png"),
    CategoryModel(title: "Essentials", image: "assets/images/electronics.png"),
    CategoryModel(title: "Makeup", image: "assets/images/beauty.png"),
    CategoryModel(title: "Always Fresh", image: "assets/images/bread.png"),
    CategoryModel(title: "Grocery Foods", image: "assets/images/food_grocery.png"),
    CategoryModel(title: "Grocery Non-Foods", image: "assets/images/non_food_grocery.png"),
    CategoryModel(title: "Essentials", image: "assets/images/electronics.png"),
    CategoryModel(title: "Makeup", image: "assets/images/beauty.png"),
    CategoryModel(title: "Always Fresh", image: "assets/images/bread.png"),
    CategoryModel(title: "Grocery Foods", image: "assets/images/food_grocery.png"),
    CategoryModel(title: "Grocery Non-Foods", image: "assets/images/non_food_grocery.png"),
    CategoryModel(title: "Essentials", image: "assets/images/electronics.png"),
    CategoryModel(title: "Makeup", image: "assets/images/beauty.png"),
    CategoryModel(title: "Always Fresh", image: "assets/images/bread.png"),
    CategoryModel(title: "Grocery Foods", image: "assets/images/food_grocery.png"),
    CategoryModel(title: "Grocery Non-Foods", image: "assets/images/non_food_grocery.png"),
    CategoryModel(title: "Essentials", image: "assets/images/electronics.png"),
    CategoryModel(title: "Makeup", image: "assets/images/beauty.png"),
  ];

  List<CategoryModel> get categories => _categories;
}
