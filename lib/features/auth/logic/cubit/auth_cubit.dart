
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/helpers/constants.dart';
import 'package:store_app/core/helpers/shared_pref_helper.dart';
import 'package:store_app/core/networking/api_error_model.dart';
import 'package:store_app/core/networking/dio_factory.dart';
import 'package:store_app/features/auth/data/models/login_request_body.dart';
import 'package:store_app/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthRepo authRepo;
  AuthCubit({required this.authRepo}) : super(AuthInitial());


  void login(String email, String password)async{
    final result = await authRepo.login(LoginRequestBody(email: email, password: password));
    result.when(
      onSuccess: (data)async{
        await saveUserToken(data.accessToken?? '');
        emit(LoginState());
    }, onError: (error){
      emit(ErrorState(error: error));
    });
  }

   Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }


}
