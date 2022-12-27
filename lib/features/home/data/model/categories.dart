import 'package:shop_now/features/home/domain/entities/categories.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({
    required super.status,
    required super.data,
    required super.firstPageUrl,
    required super.from,
    required super.lastPage,
    required super.lastPageUrl,
    required super.nextPageUrl,
    required super.path,
    required super.perPage,
    required super.to,
    required super.total,
  });
}

class DataCategoriesModel extends DataCategories {
  const DataCategoriesModel({
    required super.currentPage,
    required super.data,
  });
  factory DataCategoriesModel.fromJson(Map<String, dynamic> json) {
    List<DataItemModel>data = [];
    if(json['data']!=null){
      json['data'].forEach((element)
      {
        data.add(DataItemModel.fromJson(element));
      });
    }
    return DataCategoriesModel(
      currentPage: json['current_page'],
      data: data,
    );
  }
}

class DataItemModel extends DataItem {
  const DataItemModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory DataItemModel.fromJson(Map<String, dynamic> json) {
    return DataItemModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
