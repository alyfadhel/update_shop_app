import 'package:shop_now/features/favorites/domain/entities/favorites.dart';

class FavoritesModel extends Favorites {
  const FavoritesModel({
    required super.status,
    required super.data,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      status: json['status'],
      data: json['data']!=null? FavoriteDataModel.fromJson(json['data']): null,
    );
  }
}

class FavoriteDataModel extends FavoriteData {
  const FavoriteDataModel({
    required super.currentPage,
    required super.data,
  });

  factory FavoriteDataModel.fromJson(Map<String, dynamic> json) {
    List<FavoriteDataDetailsModel> data = [];
    if (json['data'] != null) {
      json['data'].forEach((element) {
        FavoriteDataDetailsModel.fromJson(element);
      });
    }
    return FavoriteDataModel(
      currentPage: json['current_page'],
      data: data,
    );
  }
}

class FavoriteDataDetailsModel extends FavoriteDataDetails {
  const FavoriteDataDetailsModel({
    required super.id,
    required super.product,
  });

  factory FavoriteDataDetailsModel.fromJson(Map<String, dynamic> json) {
    return FavoriteDataDetailsModel(
      id: json['id'],
      product: FavoriteDataProductsModel.fromJson(json['product']),
    );
  }
}

class FavoriteDataProductsModel extends FavoriteDataProducts {
  const FavoriteDataProductsModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
  });

  factory FavoriteDataProductsModel.fromJson(Map<String, dynamic> json) {
    return FavoriteDataProductsModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}
