import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/home/domain/entities/categories_details.dart';
import 'package:shop_now/features/home/domain/repository/base_home_repository.dart';

class GetCategoriesDetailsUseCase extends BaseUseCase<CategoriesDataDetails,ProductsDetails>
{
  final BaseHomeRepository baseHomeRepository;

  GetCategoriesDetailsUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, CategoriesDataDetails>> call(ProductsDetails parameters)async {
    return await baseHomeRepository.getCategoriesDetails(parameters);
  }

}