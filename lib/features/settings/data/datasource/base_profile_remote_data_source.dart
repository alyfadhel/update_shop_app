import 'package:dio/dio.dart';
import 'package:shop_now/core/network/dio_helper.dart';
import 'package:shop_now/core/network/end-points.dart';
import 'package:shop_now/features/settings/data/model/profile_model.dart';

abstract class BaseProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDataSource extends BaseProfileRemoteDataSource {
  final DioHelper dioHelper;

  ProfileRemoteDataSource(this.dioHelper);

  @override
  Future<ProfileModel> getProfile() async {
    final response = await dioHelper.get(
      endPoint: profileEndPoint,
    );

    return ProfileModel.fromJson(response);
  }
}
