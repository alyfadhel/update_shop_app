import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/register/domain/entities/register.dart';
import 'package:shop_now/features/register/domain/repository/base_login_repository.dart';

class GetRegisterUseCase extends BaseUseCase<Register,RegisterParameters>
{
  final BaseRegisterRepository baseRegisterRepository;

  GetRegisterUseCase(this.baseRegisterRepository);
  @override
  Future<Either<Failure, Register>> call(RegisterParameters parameters)async {
    return await baseRegisterRepository.getUserRegister(parameters);
  }

}