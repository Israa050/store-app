

import 'package:store_app/core/networking/api_result.dart';
import 'package:store_app/core/networking/api_service.dart';
import 'package:store_app/features/home/data/models/category.dart';
import 'package:store_app/features/home/data/models/offer.dart';
import 'package:store_app/features/home/data/models/product.dart';

class HomeRepo {

  final ApiService apiService;

  HomeRepo({required this.apiService});

  Future<ApiResult<Products>> getProducts () async {
    try {
      final response = await apiService.getProducts();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }


   Future<ApiResult<CategoryModel>> getCategories () async {
    try {
      final response = await apiService.getCategories();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

   Future<ApiResult<Offers>> getOffers() async {
    try {
      final response = await apiService.getOffers();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

}