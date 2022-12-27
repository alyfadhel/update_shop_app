import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/features/login/domain/entities/login.dart';
import 'package:shop_now/features/login/domain/repository/base_login_repostiory.dart';
import 'package:shop_now/features/login/domain/usecase/get_login_user_use_case.dart';
import 'package:shop_now/features/login/presentation/controller/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  Login? login;
  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final GetLoginUserUseCase getLoginUserUseCase;
  LoginCubit(
    this.getLoginUserUseCase,
  ) : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);


  void changeLoginPasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeLoginPasswordVisibility());
  }

  void getUserLogin({
    required String email,
    required String password,
  }) async {
    emit(GetUserLoginLoadingState());
    final result = await getLoginUserUseCase(
      LoginParameters(
        email: email,
        password: password,
      ),
    );
    debugPrint(result.toString());
    result.fold(
      (l) => emit(
        GetUserLoginErrorState(l.message),
      ),
      (r) {
        login = r;
        emit(
          GetUserLoginSuccessState(r),
        );
      },
    );
  }
}
