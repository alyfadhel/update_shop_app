import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/exception.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/features/login/data/datasource/base_login_remote_data_source.dart';
import 'package:shop_now/features/login/domain/entities/login.dart';
import 'package:shop_now/features/login/domain/repository/base_login_repostiory.dart';

class LoginRepository extends BaseLoginRepository
{
  final BaseLoginRemoteDataSource baseLoginRemoteDataSource;

  LoginRepository(this.baseLoginRemoteDataSource);
  @override
  Future<Either<Failure, Login>> getUserLogin(LoginParameters parameters)async {
    final result = await baseLoginRemoteDataSource.getUserModel(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.message),);
    }
  }

}