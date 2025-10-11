
import 'package:store_app/core/networking/api_result.dart';
import 'package:store_app/core/networking/api_service.dart';
import 'package:store_app/features/review/data/models/review.dart';

class ProductReviewRepo {
  final ApiService apiService;

  ProductReviewRepo({required this.apiService});

   Future<ApiResult<ReviewModel>> getProductReviews (String id) async {
    try {
      final response = await apiService.getProductReviws(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

}