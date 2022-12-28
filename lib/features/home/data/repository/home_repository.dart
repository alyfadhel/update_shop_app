import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/exception.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/features/home/data/datasource/base_home_remote_data_source.dart';
import 'package:shop_now/features/home/domain/entities/categories.dart';
import 'package:shop_now/features/home/domain/entities/categories_details.dart';
import 'package:shop_now/features/home/domain/entities/change_favorites.dart';
import 'package:shop_now/features/home/domain/entities/home.dart';
import 'package:shop_now/features/home/domain/repository/base_home_repository.dart';

class HomeRepository extends BaseHomeRepository
{
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepository(this.baseHomeRemoteDataSource);
  @override
  Future<Either<Failure, Home>> getHome() async{
    final result = await baseHomeRemoteDataSource.getHome();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.message,),);
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getProductsDetails(ProductsDetails productsDetails)async {
    final result = await baseHomeRemoteDataSource.getProductsDetails(productsDetails);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.message),);
    }
  }

  @override
  Future<Either<Failure, DataCategories>> getCategories() async{
    final result = await baseHomeRemoteDataSource.getCategories();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, CategoriesDataDetails>> getCategoriesDetails(ProductsDetails productsDetails)async {
    final result = await baseHomeRemoteDataSource.getCategoriesDetails(productsDetails);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.message),);
    }
  }

  @override
  Future<Either<Failure, ChangeFavorites>> getChangeFavorites(ProductsDetails productsDetails)async {
    final result = await baseHomeRemoteDataSource.getChangeFavorites(productsDetails);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.message),);
    }
  }

}