import 'package:shop_now/core/network/dio_helper.dart';
import 'package:shop_now/core/network/end-points.dart';
import 'package:shop_now/features/home/data/model/categories.dart';
import 'package:shop_now/features/home/data/model/home_model.dart';
import 'package:shop_now/features/home/domain/repository/base_home_repository.dart';

abstract class BaseHomeRemoteDataSource {
  Future<HomeModel> getHome();

  Future<List<ProductsModel>> getProductsDetails(
      ProductsDetails productsDetails);

  Future<DataCategoriesModel>getCategories();
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
        'id' : productsDetails.id,
      },
    );

    return List<ProductsModel>.from((response['data']['products'] as List)
    .map((e) => ProductsModel.fromJson(e)));
  }

  @override
  Future<DataCategoriesModel> getCategories() async{
    final response = await dioHelper.get(endPoint: categoriesEndPoint);
    return DataCategoriesModel.fromJson(response['data']);
  }




}
