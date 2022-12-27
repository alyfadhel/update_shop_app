import 'package:shop_now/features/home/domain/entities/categories.dart';
import 'package:shop_now/features/home/domain/entities/categories_details.dart';
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

class GetCategoriesSuccessState extends HomeStates
{
  final DataCategories dataCategories;

  GetCategoriesSuccessState(this.dataCategories);
}
class GetCategoriesErrorState extends HomeStates
{
  final String error;

  GetCategoriesErrorState(this.error);
}


class GetCategoriesDetailsLoadingState extends HomeStates{}

class GetCategoriesDetailsSuccessState extends HomeStates
{
  final CategoriesDataDetails categoriesDataDetails;

  GetCategoriesDetailsSuccessState(this.categoriesDataDetails);
}
class GetCategoriesDetailsErrorState extends HomeStates
{
  final String error;

  GetCategoriesDetailsErrorState(this.error);
}