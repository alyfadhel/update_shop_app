import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/favorites/domain/entities/favorites.dart';
import 'package:shop_now/features/favorites/domain/repository/base_favorite_repository.dart';

class GetFavoritesUseCae extends BaseUseCase<Favorites,NoParameters>
{
  final BaseFavoritesRepository baseFavoritesRepository;

  GetFavoritesUseCae(this.baseFavoritesRepository);
  @override
  Future<Either<Failure, Favorites>> call(NoParameters parameters)async {
    return await baseFavoritesRepository.getFavorites();
  }

}