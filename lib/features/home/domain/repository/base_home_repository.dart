import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/features/home/domain/entities/categories.dart';
import 'package:shop_now/features/home/domain/entities/home.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, Home>> getHome();

  Future<Either<Failure, List<Products>>> getProductsDetails(ProductsDetails productsDetails);

  Future<Either<Failure,DataCategories>>getCategories();
}

class ProductsDetails extends Equatable {
  final int id;

  const ProductsDetails({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
