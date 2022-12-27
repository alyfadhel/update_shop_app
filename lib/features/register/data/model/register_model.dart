import 'package:shop_now/features/register/domain/entities/register.dart';

class RegisterModel extends Register {
  const RegisterModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? DataModel.fromJson(json['data']): null,
    );
  }
}

class DataModel extends Data {
  const DataModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.image,
    required super.token,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      token: json['token'],
    );
  }
}
