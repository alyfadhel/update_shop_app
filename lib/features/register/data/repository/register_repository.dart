import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/exception.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/features/register/data/datasource/base_register_remote_data_source.dart';
import 'package:shop_now/features/register/domain/entities/register.dart';
import 'package:shop_now/features/register/domain/repository/base_login_repository.dart';

class RegisterRepository extends BaseRegisterRepository {
  final BaseRegisterRemoteDataSource baseRegisterRemoteDataSource;

  RegisterRepository(this.baseRegisterRemoteDataSource);

  @override
  Future<Either<Failure, Register>> getUserRegister(
      RegisterParameters parameters) async {
    final result =
        await baseRegisterRemoteDataSource.getUserRegister(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServeFailure(
          failure.errorMessageModel.message,
        ),
      );
    }
  }
}
