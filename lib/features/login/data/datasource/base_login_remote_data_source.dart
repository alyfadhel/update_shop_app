import 'package:dio/dio.dart';
import 'package:shop_now/core/error/exception.dart';
import 'package:shop_now/core/network/constance.dart';
import 'package:shop_now/core/network/dio_helper.dart';
import 'package:shop_now/core/network/end-points.dart';
import 'package:shop_now/core/network/error_message_model.dart';
import 'package:shop_now/features/login/data/model/login_model.dart';
import 'package:shop_now/features/login/domain/repository/base_login_repostiory.dart';

abstract class BaseLoginRemoteDataSource {
  Future<LoginModel> getUserModel(LoginParameters parameters);
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  final DioHelper dioHelper;

  LoginRemoteDataSource(this.dioHelper);

  @override
  Future<LoginModel> getUserModel(LoginParameters parameters) async {
    final response = await dioHelper.post(
      endPoint: loginEndPoint,
      data: {
        'email': parameters.email,
        'password': parameters.password,
      },
    );
    return LoginModel.fromJson(response);
  }
}
