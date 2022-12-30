import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/exception.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/features/settings/domain/entities/profile.dart';
import 'package:shop_now/features/update_profile/data/datasource/base_update_profile_remote_data_source.dart';
import 'package:shop_now/features/update_profile/domain/repository/base_update_profile_repository.dart';

class UpdateProfileRepository extends BaseUpdateProfileRepository
{
  final BaseUpdateProfileRemoteDataSource baseUpdateProfileRemoteDataSource;

  UpdateProfileRepository(this.baseUpdateProfileRemoteDataSource);
  @override
  Future<Either<Failure, Profile>> getUpdateProfile(UpdateProfileParameters parameters)async {
    final result = await baseUpdateProfileRemoteDataSource.getUpdateProfile(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.message),);
    }
  }

}