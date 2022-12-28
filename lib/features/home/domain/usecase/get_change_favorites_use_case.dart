import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/home/domain/entities/change_favorites.dart';
import 'package:shop_now/features/home/domain/repository/base_home_repository.dart';

class GetChangeFavoritesUseCase extends BaseUseCase<ChangeFavorites,ProductsDetails>
{
  final BaseHomeRepository baseHomeRepository;

  GetChangeFavoritesUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, ChangeFavorites>> call(ProductsDetails parameters)async {
    return baseHomeRepository.getChangeFavorites(parameters);
  }

}