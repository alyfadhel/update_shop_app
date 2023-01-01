import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/notification/domain/entities/notification.dart';

abstract class BaseNotificationRepository
{
  Future<Either<Failure,NotificationMsg>>getNotification(NoParameters parameters);
}