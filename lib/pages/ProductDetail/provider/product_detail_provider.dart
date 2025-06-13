// ignore_for_file: avoid_print

import 'package:klik_app/constants/exports.dart';

class ProductDetailProvider with ChangeNotifier {
  final _productDetailService = ProductDetailService();

  ProductDetailsModel? _detailsModel;
  ProductDetailsModel? get detailsModel => _detailsModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getProductDetails() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _productDetailService.getProduct();
      if (response != null &&
          response['success'] == true &&
          response['products'] != null) {
        _detailsModel = ProductDetailsModel.fromJson(response);
      } else {
        ToastHelper.showError("Error while fetching product details");
      }
    } catch (e) {
      print("Error in getProductDetails: $e");
      ToastHelper.showError("Something went wrong. Please try again.");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
