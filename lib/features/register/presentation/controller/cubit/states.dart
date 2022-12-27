import 'package:shop_now/features/register/domain/entities/register.dart';

abstract class RegisterStates{}

class InitialRegisterState extends RegisterStates{}

class ChangeRegisterPasswordVisibility extends RegisterStates{}

class GetRegisterUserLoadingState extends RegisterStates{}

class GetRegisterUserSuccessState extends RegisterStates
{
  final Register register;

  GetRegisterUserSuccessState(this.register);
}

class GetRegisterUserErrorState extends RegisterStates
{
  final String message;

  GetRegisterUserErrorState(this.message);
}