part of 'auth_cubit.dart';


sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginState extends AuthState{}

final class SignUpState extends AuthState{}

final class VerifyAccount extends AuthState{}

final class ErrorState extends AuthState{
  ApiErrorModel error;

  ErrorState({required this.error});
}
