import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/home/domain/entities/home.dart';
import 'package:shop_now/features/home/domain/repository/base_home_repository.dart';

class GetHomeUseCase extends BaseUseCase<Home,NoParameters>
{
  final BaseHomeRepository baseHomeRepository;

  GetHomeUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, Home>> call(NoParameters parameters)async {
    return await baseHomeRepository.getHome();
  }

}