import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/login/domain/entities/login.dart';
import 'package:shop_now/features/login/domain/repository/base_login_repostiory.dart';

class GetLoginUserUseCase extends BaseUseCase<Login,LoginParameters>
{
  final BaseLoginRepository baseLoginRepository;

  GetLoginUserUseCase(this.baseLoginRepository);
  @override
  Future<Either<Failure, Login>> call(LoginParameters parameters)async {
    return await baseLoginRepository.getUserLogin(parameters);
  }

}