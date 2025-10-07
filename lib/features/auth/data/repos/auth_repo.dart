
import 'package:store_app/core/networking/api_result.dart';
import 'package:store_app/features/auth/data/models/login_request_body.dart';
import 'package:store_app/features/auth/data/models/login_response.dart';
import 'package:store_app/features/auth/data/services/auth_service.dart';

class AuthRepo {

   final AuthService service;

  AuthRepo({required this.service});

  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await service.login(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}