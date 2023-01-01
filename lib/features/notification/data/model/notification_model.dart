import 'package:shop_now/features/notification/domain/entities/notification.dart';

class NotificationModel extends NotificationMsg {
  const NotificationModel({
    required super.status,
    required super.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      status: json['status'],
      data: DataNotificationModel.fromJson(json['data']),
    );
  }
}

class DataNotificationModel extends DataNotification {
  const DataNotificationModel({
    required super.currentPage,
    required super.data,
  });

  factory DataNotificationModel.fromJson(Map<String, dynamic> json) {
    List<DataDetailsModel> data = [];
    if (json['data'] != null) {
      json['data'].forEach((element) {
        data.add(DataDetailsModel.fromJson(element));
      });
    }
    return DataNotificationModel(
      currentPage: json['current_page'],
      data: data,
    );
  }
}

class DataDetailsModel extends DataDetails {
  const DataDetailsModel({
    required super.id,
    required super.title,
    required super.message,
  });

  factory DataDetailsModel.fromJson(Map<String, dynamic> json) {
    return DataDetailsModel(
      id: json['id'],
      title: json['title'],
      message: json['message'],
    );
  }
}
