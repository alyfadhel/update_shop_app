import 'package:shop_now/features/settings/domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.status,
    required super.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: json['status'],
      data: ProfileDataModel.fromJson(json['data']) ,
    );
  }
}

class ProfileDataModel extends ProfileData {
  const ProfileDataModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.image,
    required super.points,
    required super.credit,
    required super.token,
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) {
    return ProfileDataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      points: json['points'],
      credit: json['credit'],
      token: json['token'],
    );
  }
}
