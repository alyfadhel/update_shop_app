import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ChangeFavorites extends Equatable {
  final bool status;
  final String message;
  final DataFavorites? data;

  const ChangeFavorites({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}

class DataFavorites extends Equatable {
  final int id;
  final FavoriteProduct product;

  const DataFavorites({
    required this.id,
    required this.product,
  });

  @override
  List<Object?> get props => [
        id,
        product,
      ];
}

class FavoriteProduct extends Equatable {
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;

  const FavoriteProduct({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  @override
  List<Object?> get props => [
    id,
    price,
    oldPrice,
    discount,
    image,
  ];
}
