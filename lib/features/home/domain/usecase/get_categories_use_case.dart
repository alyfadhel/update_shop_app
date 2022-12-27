import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/home/domain/entities/categories.dart';
import 'package:shop_now/features/home/domain/repository/base_home_repository.dart';

class GetCategoriesUseCase extends BaseUseCase<DataCategories,NoParameters>
{
  final BaseHomeRepository baseHomeRepository;

  GetCategoriesUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, DataCategories>> call(NoParameters parameters)async {
    return await baseHomeRepository.getCategories();
  }

}