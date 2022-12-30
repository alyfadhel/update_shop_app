import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/settings/domain/entities/profile.dart';
import 'package:shop_now/features/update_profile/domain/repository/base_update_profile_repository.dart';

class GetUpdateProfileUseCase extends BaseUseCase<Profile,UpdateProfileParameters>
{
  final BaseUpdateProfileRepository baseUpdateProfileRepository;

  GetUpdateProfileUseCase(this.baseUpdateProfileRepository);

  @override
  Future<Either<Failure, Profile>> call(UpdateProfileParameters parameters)async {
    return await baseUpdateProfileRepository.getUpdateProfile(parameters);
  }
}