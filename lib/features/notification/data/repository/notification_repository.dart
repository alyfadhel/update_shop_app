import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/exception.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/notification/data/datasource/base_notification_remote_data_source.dart';
import 'package:shop_now/features/notification/domain/entities/notification.dart';
import 'package:shop_now/features/notification/domain/repository/base_notification_repository.dart';

class NotificationRepository extends BaseNotificationRepository
{
  final BaseNotificationRemoteDataSource baseNotificationRemoteDataSource;

  NotificationRepository(this.baseNotificationRemoteDataSource);
  @override
  Future<Either<Failure, NotificationMsg>> getNotification(NoParameters parameters)async {
    final result = await baseNotificationRemoteDataSource.getNotification();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServeFailure(failure.errorMessageModel.message));
    }
  }

}