import 'package:shop_now/core/network/dio_helper.dart';
import 'package:shop_now/core/network/end-points.dart';
import 'package:shop_now/features/favorites/data/model/favorites_model.dart';

abstract class BaseFavoriteRemoteDataSource {
  Future<FavoritesModel> getFavorites();
}

class FavoriteRemoteDataSource extends BaseFavoriteRemoteDataSource {
  final DioHelper dioHelper;

  FavoriteRemoteDataSource(this.dioHelper);

  @override
  Future<FavoritesModel> getFavorites() async {
    final response = await dioHelper.get(
      endPoint: favoritesEndPoint,
      Authorization: token,
    );
    return FavoritesModel.fromJson(response['data']['data']);
  }
}
