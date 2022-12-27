import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/core/layout/cubit/states.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/categories/presentation/screens/categories.dart';
import 'package:shop_now/features/favorites/presentation/screens/favorites.dart';
import 'package:shop_now/features/home/domain/entities/categories.dart';
import 'package:shop_now/features/home/domain/entities/categories_details.dart';
import 'package:shop_now/features/home/domain/entities/home.dart';
import 'package:shop_now/features/home/domain/repository/base_home_repository.dart';
import 'package:shop_now/features/home/domain/usecase/get_categories_details_use_case.dart';
import 'package:shop_now/features/home/domain/usecase/get_categories_use_case.dart';
import 'package:shop_now/features/home/domain/usecase/get_home_use_case.dart';
import 'package:shop_now/features/home/domain/usecase/get_products_details_use_case.dart';
import 'package:shop_now/features/home/presentation/screens/home.dart';
import 'package:shop_now/features/settings/presentation/screens/settings.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(
    this.getHomeUseCase,
    this.getProductsDetailsUseCase,
    this.getCategoriesUseCase,
    this.getCategoriesDetailsUseCase,
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
  Home? home;
  List<Products> products = [];
  DataCategories? dataCategories;
  CategoriesDataDetails? categoriesDataDetails;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNav());
  }

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
        GetHomeSuccessState(
          r,
        ),
      );
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
}
