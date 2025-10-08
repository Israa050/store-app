


import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:store_app/core/networking/api_constants.dart';


part 'api_service.g.dart';


@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {

     factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


  @GET(ApiConstants.products)
  Future<void> getProducts();

  @GET(ApiConstants.categories)
  Future<void> getCategories();

  @GET(ApiConstants.offers)
  Future<void> getOffers();


}