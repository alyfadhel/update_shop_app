import 'package:shop_now/features/home/domain/entities/categories.dart';
import 'package:shop_now/features/home/domain/entities/home.dart';

abstract class HomeStates {}

class InitialHomeState extends HomeStates{}

class ChangeBottomNav extends HomeStates{}

class GetHomeLoadingState extends HomeStates{}
class GetHomeSuccessState extends HomeStates
{
  final Home home;

  GetHomeSuccessState(this.home);
}
class GetHomeErrorState extends HomeStates
{
  final String message;

  GetHomeErrorState(this.message);
}

class GetProductsDetailsLoadingState extends HomeStates{}
class GetProductsDetailsSuccessState extends HomeStates
{
  final List<Products>products;

  GetProductsDetailsSuccessState(this.products);
}
class GetProductsDetailsErrorState extends HomeStates
{
  final String message;

  GetProductsDetailsErrorState(this.message);
}

class GetCategoriesSuccessLoading extends HomeStates
{
  final DataCategories dataCategories;

  GetCategoriesSuccessLoading(this.dataCategories);
}
class GetCategoriesErrorLoading extends HomeStates
{
  final String error;

  GetCategoriesErrorLoading(this.error);
}