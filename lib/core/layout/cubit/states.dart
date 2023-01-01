import 'package:shop_now/features/favorites/domain/entities/favorites.dart';
import 'package:shop_now/features/home/domain/entities/categories.dart';
import 'package:shop_now/features/home/domain/entities/categories_details.dart';
import 'package:shop_now/features/home/domain/entities/change_favorites.dart';
import 'package:shop_now/features/home/domain/entities/home.dart';
import 'package:shop_now/features/notification/domain/entities/notification.dart';
import 'package:shop_now/features/settings/domain/entities/profile.dart';

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

class GetChangeFavoritesSuccessState extends HomeStates
{
  final ChangeFavorites changeFavorites;

  GetChangeFavoritesSuccessState(this.changeFavorites);
}

class GetChangeFavoritesErrorSuccessState extends HomeStates
{
  final String error;

  GetChangeFavoritesErrorSuccessState(this.error);
}

class ChangeFavoritesIcon extends HomeStates{}

class GetFavoritesLoadingState extends HomeStates{}
class GetFavoritesSuccessState extends HomeStates {
  final List<FavoriteDataDetails> model;

  GetFavoritesSuccessState(this.model);
}
class GetFavoritesErrorState extends HomeStates
{
  final String error;

  GetFavoritesErrorState(this.error);
}

class GetProfileLoadingState extends HomeStates {}
class GetProfileSuccessState extends HomeStates
{
  final Profile profile;

  GetProfileSuccessState(this.profile);
}
class GetProfileErrorState extends HomeStates
{
  final String error;

  GetProfileErrorState(this.error);
}

class GetImagePickedSuccessState extends HomeStates{}
class GetImagePickedErrorState extends HomeStates {}


class GetUpdateProfileLoadingState extends HomeStates{}
class GetUpdateProfileSuccessState extends HomeStates
{
  final Profile updateProfile;

  GetUpdateProfileSuccessState(this.updateProfile);
}

class GetUpdateProfileErrorState extends HomeStates
{
  final String error;

  GetUpdateProfileErrorState(this.error);
}

class GetNotificationLoadingState extends HomeStates{}

class GetNotificationSuccessState extends HomeStates
{
  final NotificationMsg notification;

  GetNotificationSuccessState(this.notification);
}
class GetNotificationErrorState extends HomeStates
{
  final String error;

  GetNotificationErrorState(this.error);
}
