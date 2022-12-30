import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/settings/domain/entities/profile.dart';
import 'package:shop_now/features/settings/domain/repository/base_profile_repository.dart';

class GetProfileUseCase extends BaseUseCase<Profile,NoParameters>
{
  final BaseProfileRepository baseProfileRepository;

  GetProfileUseCase(this.baseProfileRepository);
  @override
  Future<Either<Failure, Profile>> call(NoParameters parameters)async {
    return await baseProfileRepository.getProfile();
  }

}