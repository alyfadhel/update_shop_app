import 'package:shop_now/core/network/dio_helper.dart';
import 'package:shop_now/core/network/end-points.dart';
import 'package:shop_now/features/favorites/data/model/favorites_model.dart';
import 'package:shop_now/features/favorites/domain/entities/favorites.dart';

abstract class BaseFavoriteRemoteDataSource {
  Future<List<FavoriteDataDetailsModel>> getFavorites();
}

class FavoriteRemoteDataSource extends BaseFavoriteRemoteDataSource {
  final DioHelper dioHelper;

  FavoriteRemoteDataSource(this.dioHelper);

  @override
  Future<List<FavoriteDataDetailsModel>> getFavorites() async {
    final response = await dioHelper.get(
      endPoint: favoritesEndPoint,
      Authorization: token,
    );
    return List<FavoriteDataDetailsModel>.from((response['data']['data'] as List)
    .map((e) => FavoriteDataDetailsModel.fromJson(e)));
  }
}
