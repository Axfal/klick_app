import 'package:klik_app/constants/exports.dart';

class CategoryService {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>?> getCategory() async {
    return await _apiClient.get('/get_categories.php');
  }
}
