import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_now/core/layout/cubit/states.dart';
import 'package:shop_now/core/network/end-points.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/categories/presentation/screens/categories.dart';
import 'package:shop_now/features/favorites/domain/entities/favorites.dart';
import 'package:shop_now/features/favorites/domain/usecase/get_favorites_use_case.dart';
import 'package:shop_now/features/favorites/presentation/screens/favorites.dart';
import 'package:shop_now/features/home/domain/entities/categories.dart';
import 'package:shop_now/features/home/domain/entities/categories_details.dart';
import 'package:shop_now/features/home/domain/entities/change_favorites.dart';
import 'package:shop_now/features/home/domain/entities/home.dart';
import 'package:shop_now/features/home/domain/repository/base_home_repository.dart';
import 'package:shop_now/features/home/domain/usecase/get_categories_details_use_case.dart';
import 'package:shop_now/features/home/domain/usecase/get_categories_use_case.dart';
import 'package:shop_now/features/home/domain/usecase/get_change_favorites_use_case.dart';
import 'package:shop_now/features/home/domain/usecase/get_home_use_case.dart';
import 'package:shop_now/features/home/domain/usecase/get_products_details_use_case.dart';
import 'package:shop_now/features/home/presentation/screens/home.dart';
import 'package:shop_now/features/settings/domain/entities/profile.dart';
import 'package:shop_now/features/settings/domain/usecase/get_profile_use_case.dart';
import 'package:shop_now/features/settings/presentation/screens/settings.dart';
import 'package:shop_now/features/update_profile/domain/repository/base_update_profile_repository.dart';
import 'package:shop_now/features/update_profile/domain/usecase/get_update_profile_use_case.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(
    this.getHomeUseCase,
    this.getProductsDetailsUseCase,
    this.getCategoriesUseCase,
    this.getCategoriesDetailsUseCase,
    this.getChangeFavoritesUseCase,
    this.getFavoritesUseCae,
    this.getProfileUseCase,
    this.getUpdateProfileUseCase,
  ) : super(InitialHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.category,
      ),
      label: 'Categories',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite_sharp,
      ),
      label: 'Favorites',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'settings',
    ),
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'Categories',
    'Favorites',
    'settings',
  ];

  final GetHomeUseCase getHomeUseCase;
  final GetProductsDetailsUseCase getProductsDetailsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetCategoriesDetailsUseCase getCategoriesDetailsUseCase;
  final GetChangeFavoritesUseCase getChangeFavoritesUseCase;
  final GetFavoritesUseCae getFavoritesUseCae;
  final GetProfileUseCase getProfileUseCase;
  final GetUpdateProfileUseCase getUpdateProfileUseCase;
  Home? home;
  List<Products> products = [];
  DataCategories? dataCategories;
  CategoriesDataDetails? categoriesDataDetails;
  ChangeFavorites? changeFavorites;
  List<FavoriteDataDetails> model = [];
  Profile? profile;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var imageController = TextEditingController();

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNav());
  }

  //add products into favorites list
  Map<int, bool> favorites = {};

  // This map for turnover all products to add into favorites

  void getHome() async {
    emit(GetHomeLoadingState());
    final result = await getHomeUseCase(const NoParameters());
    debugPrint(result.toString());
    result.fold(
        (l) => emit(
              GetHomeErrorState(
                l.message,
              ),
            ), (r) {
      home = r;
      emit(
        GetHomeSuccessState(r),
      );
    });
    home!.data.products.forEach((element) {
      favorites.addAll({
        element.id: element.inFavorites,
      });
    });
    debugPrint(favorites.toString());
  }

  void changeFavoritesItem(int productId) async {
    favorites[productId] =
        !favorites[productId]!; // change icon favorites at this time now
    emit(ChangeFavoritesIcon());
    final result = await getChangeFavoritesUseCase(
      ProductsDetails(id: productId),
    );
    debugPrint(result.toString());
    result.fold((l) {
      favorites[productId] = !favorites[productId]!;
      emit(GetChangeFavoritesErrorSuccessState(l.message));
    }, (r) {
      changeFavorites = r;
      if (!changeFavorites!.status) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }
      emit(GetChangeFavoritesSuccessState(r));
    });
  }

  void getProductsDetails({required int id}) async {
    emit(GetProductsDetailsLoadingState());
    final result = await getProductsDetailsUseCase(ProductsDetails(id: id));

    debugPrint(result.toString());

    result.fold(
      (l) => emit(GetProductsDetailsErrorState(l.message)),
      (r) {
        products = r;
        emit(GetProductsDetailsSuccessState(r));
      },
    );
  }

  void getCategories() async {
    final result = await getCategoriesUseCase(const NoParameters());
    debugPrint(result.toString());

    result.fold(
      (l) => emit(GetCategoriesErrorState(l.message)),
      (r) {
        dataCategories = r;
        emit(GetCategoriesSuccessState(r));
      },
    );
  }

  void getCategoriesDetails(int productsId) async {
    emit(GetCategoriesDetailsLoadingState());
    final result = await getCategoriesDetailsUseCase(
      ProductsDetails(id: productsId),
    );
    debugPrint('Details: $result');

    result.fold(
      (l) => emit(GetCategoriesDetailsErrorState(l.message)),
      (r) {
        categoriesDataDetails = r;
        emit(GetCategoriesDetailsSuccessState(r));
      },
    );
  }

  void getFavorites() async {
    emit(GetFavoritesLoadingState());
    final result = await getFavoritesUseCae(const NoParameters());
    debugPrint('Favorites: $result');

    result.fold(
      (l) => emit(GetFavoritesErrorState(l.message)),
      (r) {
        model = r;
        emit(GetFavoritesSuccessState(r));
      },
    );
  }

  void getProfile() async {
    emit(GetProfileLoadingState());
    final result = await getProfileUseCase(const NoParameters());

    result.fold(
      (l) => emit(GetProfileErrorState(l.message)),
      (r) {
        profile = r;
        nameController.clear();
        phoneController.clear();
        emailController.clear();
        emit(GetProfileSuccessState(r));
      },
    );
  }


  void getUpdateProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(GetUpdateProfileLoadingState());
    final result = await getUpdateProfileUseCase(
      UpdateProfileParameters(
        name: name,
        phone: phone,
        email: email,
      ),
    );

    result.fold((l) => emit(GetUpdateProfileErrorState(l.message)), (r) {
      profile = r;
      emit(GetUpdateProfileSuccessState(r));
    });
  }


}
//LsoPMudaz5KXcMckB4iYjPePxNVv4GjCItOFw6J7nypbAGvjJmXLe2nJpRfpEFwn5niKiT
