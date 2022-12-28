import 'package:shop_now/features/home/domain/entities/change_favorites.dart';

class ChangeFavoritesModel extends ChangeFavorites {
  const ChangeFavoritesModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory ChangeFavoritesModel.fromJson(Map<String, dynamic> json) {
    return ChangeFavoritesModel(
      status: json['status'],
      message: json['message'],
      data: json['data']!=null ? DataFavoritesModel.fromJson(json['data']) : null,
    );
  }
}

class DataFavoritesModel extends DataFavorites {
  const DataFavoritesModel({
    required super.id,
    required super.product,
  });

  factory DataFavoritesModel.fromJson(Map<String, dynamic> json) {
    return DataFavoritesModel(
      id: json['id'],
      product: FavoriteProductModel.fromJson(json['product']),
    );
  }
}

class FavoriteProductModel extends FavoriteProduct {
  const FavoriteProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
  });

  factory FavoriteProductModel.fromJson(Map<String, dynamic> json) {
    return FavoriteProductModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
    );
  }
}
