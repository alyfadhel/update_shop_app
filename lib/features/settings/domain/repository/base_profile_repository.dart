import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/features/settings/domain/entities/profile.dart';

abstract class BaseProfileRepository
{
  Future<Either<Failure,Profile>>getProfile();
}