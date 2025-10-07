


import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:store_app/core/networking/api_constants.dart';
import 'package:store_app/features/auth/data/models/login_request_body.dart';
import 'package:store_app/features/auth/data/models/login_response.dart';

part 'auth_service.g.dart';


@RestApi(baseUrl: ApiConstants.apiBaseUrl)

abstract class AuthService {

   factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  


}