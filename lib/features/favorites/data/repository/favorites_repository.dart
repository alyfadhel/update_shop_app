import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/exception.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/features/favorites/data/datasource/base_favorite_remote_data_source.dart';
import 'package:shop_now/features/favorites/domain/entities/favorites.dart';
import 'package:shop_now/features/favorites/domain/repository/base_favorite_repository.dart';

class FavoritesRepository extends BaseFavoritesRepository
{
  final BaseFavoriteRemoteDataSource baseFavoriteRemoteDataSource;

  FavoritesRepository(this.baseFavoriteRemoteDataSource);
  @override
  Future<Either<Failure, Favorites>> getFavorites() async{
    final result = await baseFavoriteRemoteDataSource.getFavorites();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.message),);
    }
  }

}