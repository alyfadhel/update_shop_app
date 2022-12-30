import 'package:shop_now/core/network/dio_helper.dart';
import 'package:shop_now/core/network/end-points.dart';
import 'package:shop_now/features/settings/data/model/profile_model.dart';
import 'package:shop_now/features/update_profile/domain/repository/base_update_profile_repository.dart';

abstract class BaseUpdateProfileRemoteDataSource {
  Future<ProfileModel> getUpdateProfile(
      UpdateProfileParameters parameters);
}

class UpdateProfileRemoteDataSource extends BaseUpdateProfileRemoteDataSource {
  final DioHelper dioHelper;

  UpdateProfileRemoteDataSource(this.dioHelper);

  @override
  Future<ProfileModel> getUpdateProfile(
      UpdateProfileParameters parameters) async {
    final response = await dioHelper.put(
      endPoint: updateProfileEndPoint,
      data: {
        'name' : parameters.name,
        'email' : parameters.email,
        'phone' : parameters.phone,
      }
    );
    return ProfileModel.fromJson(response);
  }
}
