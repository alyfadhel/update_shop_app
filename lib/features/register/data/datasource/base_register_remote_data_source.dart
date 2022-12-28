import 'package:shop_now/core/network/dio_helper.dart';
import 'package:shop_now/core/network/end-points.dart';
import 'package:shop_now/features/register/data/model/register_model.dart';
import 'package:shop_now/features/register/domain/repository/base_login_repository.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<RegisterModel> getUserRegister(RegisterParameters parameters);
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  final DioHelper dioHelper;

  RegisterRemoteDataSource(this.dioHelper);

  @override
  Future<RegisterModel> getUserRegister(RegisterParameters parameters) async {
    final response = await dioHelper.post(
      endPoint: registerEndPoint,
      data: {
        'name' : parameters.name,
        'email' : parameters.email,
        'phone' : parameters.phone,
        'password' : parameters.password,
      },

    );
    return RegisterModel.fromJson(response);
  }
}
