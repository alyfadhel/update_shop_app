import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/features/settings/domain/entities/profile.dart';

abstract class BaseUpdateProfileRepository {
  Future<Either<Failure, Profile>> getUpdateProfile(UpdateProfileParameters parameters);
}

class UpdateProfileParameters extends Equatable {
  final String name;
  final String phone;
  final String email;


  const UpdateProfileParameters({
    required this.name,
    required this.phone,
    required this.email,

  });

  @override
  List<Object?> get props => [
    name,
    phone,
    email,
  ];
}
