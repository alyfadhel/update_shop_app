import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/features/register/domain/entities/register.dart';
import 'package:shop_now/features/register/domain/repository/base_login_repository.dart';
import 'package:shop_now/features/register/domain/usecase/get_register_use_case.dart';
import 'package:shop_now/features/register/presentation/controller/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  Register? register;
  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  final GetRegisterUseCase getRegisterUseCase;

  RegisterCubit(
    this.getRegisterUseCase,
  ) : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeRegisterPasswordVisibility());
  }

  void getRegisterUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(GetRegisterUserLoadingState());
    final result = await getRegisterUseCase(
      RegisterParameters(
        name: name,
        email: email,
        phone: phone,
        password: password,
      ),
    );
    debugPrint(result.toString());
    result.fold(
      (l) => emit(
        GetRegisterUserErrorState(l.message),
      ),
      (r) {
        register = r;
        emit(
          GetRegisterUserSuccessState(r),
        );
      },
    );
  }
}
