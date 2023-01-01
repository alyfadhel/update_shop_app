import 'package:dartz/dartz.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/usecase/base_user_case.dart';
import 'package:shop_now/features/notification/domain/entities/notification.dart';
import 'package:shop_now/features/notification/domain/repository/base_notification_repository.dart';

class GetNotificationUseCase extends BaseUseCase<NotificationMsg,NoParameters>
{
  final BaseNotificationRepository baseNotificationRepository;

  GetNotificationUseCase(this.baseNotificationRepository);
  @override
  Future<Either<Failure, NotificationMsg>> call(NoParameters parameters)async {
    return await baseNotificationRepository.getNotification(parameters);
  }

}