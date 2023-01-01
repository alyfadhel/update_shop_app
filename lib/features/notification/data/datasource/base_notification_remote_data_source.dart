import 'package:shop_now/core/network/dio_helper.dart';
import 'package:shop_now/core/network/end-points.dart';
import 'package:shop_now/features/notification/data/model/notification_model.dart';

abstract class BaseNotificationRemoteDataSource {
  Future<NotificationModel> getNotification();
}

class NotificationRemoteDataSource extends BaseNotificationRemoteDataSource {
  final DioHelper dioHelper;

  NotificationRemoteDataSource(this.dioHelper);

  @override
  Future<NotificationModel> getNotification() async {
    final response = await dioHelper.get(
      endPoint: notificationsEndPoint,
      Authorization: token,
    );
    return NotificationModel.fromJson(response);
  }
}
