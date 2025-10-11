
import 'package:store_app/core/networking/api_result.dart';
import 'package:store_app/core/networking/api_service.dart';
import 'package:store_app/features/home/data/models/product.dart';
import 'package:store_app/features/review/data/models/review.dart';

class ProductRepo {
  final ApiService apiService;

  ProductRepo({required this.apiService});

   Future<ApiResult<Product>> getProductByID (String id) async {
    try {
      final response = await apiService.getProductByID(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  Future<ApiResult<Items>> getProductReviws (String id) async {
    try {
      final response = await apiService.getProductReviws(id);
      final result = response.reviews!.items![0];
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.error(e);
    }
  }


}