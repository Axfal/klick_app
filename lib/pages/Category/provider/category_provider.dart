// ignore_for_file: avoid_print

import 'package:klik_app/models/category_model.dart';
import 'package:klik_app/constants/exports.dart';

class CategoryProvider with ChangeNotifier {
  final _services = CategoryService();

  CategoriesModel? _categoryModel;
  CategoriesModel? get categoryModel => _categoryModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getCategory() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _services.getCategory();
      if (response != null &&
          response['success'] &&
          response['categories'] != null) {
        _categoryModel = CategoriesModel.fromJson(response);
      } else {
        ToastHelper.showError("Error while fetching Categories");
      }
    } catch (e) {
      print("error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  final List<CategoryModel> _categories = [
    CategoryModel(title: "Always Fresh", image: "assets/images/bread.png"),
    CategoryModel(
      title: "Grocery Foods",
      image: "assets/images/food_grocery.png",
    ),
    CategoryModel(
      title: "Grocery Non-Foods",
      image: "assets/images/non_food_grocery.png",
    ),
    CategoryModel(title: "Essentials", image: "assets/images/electronics.png"),
    CategoryModel(title: "Makeup", image: "assets/images/beauty.png"),
    CategoryModel(title: "Always Fresh", image: "assets/images/bread.png"),
    CategoryModel(
      title: "Grocery Foods",
      image: "assets/images/food_grocery.png",
    ),
    CategoryModel(
      title: "Grocery Non-Foods",
      image: "assets/images/non_food_grocery.png",
    ),
    CategoryModel(title: "Essentials", image: "assets/images/electronics.png"),
    CategoryModel(title: "Makeup", image: "assets/images/beauty.png"),
    CategoryModel(title: "Always Fresh", image: "assets/images/bread.png"),
    CategoryModel(
      title: "Grocery Foods",
      image: "assets/images/food_grocery.png",
    ),
    CategoryModel(
      title: "Grocery Non-Foods",
      image: "assets/images/non_food_grocery.png",
    ),
    CategoryModel(title: "Essentials", image: "assets/images/electronics.png"),
    CategoryModel(title: "Makeup", image: "assets/images/beauty.png"),
    CategoryModel(title: "Always Fresh", image: "assets/images/bread.png"),
    CategoryModel(
      title: "Grocery Foods",
      image: "assets/images/food_grocery.png",
    ),
    CategoryModel(
      title: "Grocery Non-Foods",
      image: "assets/images/non_food_grocery.png",
    ),
    CategoryModel(title: "Essentials", image: "assets/images/electronics.png"),
    CategoryModel(title: "Makeup", image: "assets/images/beauty.png"),
  ];

  List<CategoryModel> get categories => _categories;
}
