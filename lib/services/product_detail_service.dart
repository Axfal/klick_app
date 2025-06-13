import 'package:klik_app/constants/exports.dart';

class ProductDetailService {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>?> getProduct() async {
    return await _apiClient.get('/get_products.php');
  }
}
