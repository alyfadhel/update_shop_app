import 'package:equatable/equatable.dart';

class Favorites extends Equatable {
  final bool? status;
  final FavoriteData? data;

  const Favorites({
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        data,
      ];
}

class FavoriteData extends Equatable {
  final int currentPage;
  final List<FavoriteDataDetails> data;

  const FavoriteData({
    required this.currentPage,
    required this.data,
  });

  @override
  List<Object?> get props => [
        currentPage,
        data,
      ];
}

class FavoriteDataDetails extends Equatable {
  final int id;
  final FavoriteDataProducts product;

  const FavoriteDataDetails({
    required this.id,
    required this.product,
  });

  @override
  List<Object?> get props => [
    id,
    product,
  ];
}

class FavoriteDataProducts extends Equatable
{
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;

  const FavoriteDataProducts({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [
    id,
    price,
    oldPrice,
    discount,
    image,
    name,
    description,
  ];
}
