import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final bool status;
  final DataCategories data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final String nextPageUrl;
  final String path;
  final int perPage;
  final int to;
  final int total;

  const Categories({
    required this.status,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  @override
  List<Object?> get props => [
        status,
        data,
        firstPageUrl,
        from,
        lastPage,
        lastPageUrl,
        nextPageUrl,
        path,
        perPage,
        to,
        total,
      ];
}

class DataCategories extends Equatable {
  final int currentPage;
  final List<DataItem> data;

  const DataCategories({
    required this.currentPage,
    required this.data,
  });

  @override
  List<Object?> get props => [
        currentPage,
        data,
      ];
}

class DataItem extends Equatable {
  final int id;
  final String name;
  final String image;

  const DataItem({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        image,
      ];
}
