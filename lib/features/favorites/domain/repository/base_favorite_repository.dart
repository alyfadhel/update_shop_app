import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/features/favorites/domain/entities/favorites.dart';

abstract class BaseFavoritesRepository
{
  Future<Either<Failure,List<FavoriteDataDetails>>>getFavorites();
}