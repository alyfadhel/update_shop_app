import 'package:shop_now/features/login/domain/entities/login.dart';

abstract class LoginStates{}

class InitialLoginState extends LoginStates{}

class ChangeLoginPasswordVisibility extends LoginStates{}

class GetUserLoginLoadingState extends LoginStates{}

class GetUserLoginSuccessState extends LoginStates
{
  final Login login;

  GetUserLoginSuccessState(this.login);
}

class GetUserLoginErrorState extends LoginStates
{
  final String message;

  GetUserLoginErrorState(this.message);
}