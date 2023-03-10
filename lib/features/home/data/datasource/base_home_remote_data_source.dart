import 'package:shop_now/core/network/dio_helper.dart';
import 'package:shop_now/core/network/end-points.dart';
import 'package:shop_now/features/home/data/model/cahnge_favorites_model.dart';
import 'package:shop_now/features/home/data/model/categories.dart';
import 'package:shop_now/features/home/data/model/categories_details_model.dart';
import 'package:shop_now/features/home/data/model/home_model.dart';
import 'package:shop_now/features/home/domain/repository/base_home_repository.dart';

abstract class BaseHomeRemoteDataSource {
  Future<HomeModel> getHome();

  Future<List<ProductsModel>> getProductsDetails(
      ProductsDetails productsDetails);

  Future<DataCategoriesModel> getCategories();

  Future<CategoriesDataDetailsModel> getCategoriesDetails(
      ProductsDetails productsDetails);

  Future<ChangeFavoritesModel> getChangeFavorites(
      ProductsDetails productsDetails);
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  final DioHelper dioHelper;

  HomeRemoteDataSource(this.dioHelper);

  @override
  Future<HomeModel> getHome() async {
    final response = await dioHelper.get(
      endPoint: homeEndPoint,
      Authorization: token,
    );
    return HomeModel.fromJson(response);
  }

  @override
  Future<List<ProductsModel>> getProductsDetails(
      ProductsDetails productsDetails) async {
    final response = await dioHelper.get(
      endPoint: homeEndPoint,
      data: {
        'id': productsDetails.id,
      },
      Authorization: token,
    );

    return List<ProductsModel>.from((response['data']['products'] as List)
        .map((e) => ProductsModel.fromJson(e)));
  }

  @override
  Future<DataCategoriesModel> getCategories() async {
    final response = await dioHelper.get(
      endPoint: categoriesEndPoint,
      Authorization: token,
    );
    return DataCategoriesModel.fromJson(response['data']);
  }

  @override
  Future<CategoriesDataDetailsModel> getCategoriesDetails(
      ProductsDetails productsDetails) async {
    final response = await dioHelper.get(
      endPoint: categoriesDetailsEndPoint(productsDetails.id),
      Authorization: token,
    );
    return CategoriesDataDetailsModel.fromJson((response['data']));
  }

  @override
  Future<ChangeFavoritesModel> getChangeFavorites(
      ProductsDetails productsDetails) async {
    final response = await dioHelper.post(
      endPoint: changeFavoritesEndPoint,
      data: {
        'product_id': productsDetails.id,
      },
      Authorization: token,
    );
    return ChangeFavoritesModel.fromJson(response);
  }
}
