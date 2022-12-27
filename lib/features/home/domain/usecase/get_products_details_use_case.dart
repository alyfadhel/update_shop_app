import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/home/domain/entities/home.dart';
import 'package:shop_now/features/home/domain/repository/base_home_repository.dart';

class GetProductsDetailsUseCase extends BaseUseCase<List<Products>,ProductsDetails>
{
  final BaseHomeRepository baseHomeRepository;

  GetProductsDetailsUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, List<Products>>> call(ProductsDetails parameters)async {
    return await baseHomeRepository.getProductsDetails(parameters);
  }

}