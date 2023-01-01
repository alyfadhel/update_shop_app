import 'package:equatable/equatable.dart';

class NotificationMsg extends Equatable
{
  final bool? status;
  final DataNotification data;

  const NotificationMsg({
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => [
    status,
    data,
  ];

}

class DataNotification extends Equatable
{
  final int currentPage;
  final List<DataDetails> data;

  const DataNotification({
    required this.currentPage,
    required this.data,
  });

  @override
  List<Object?> get props => [
    currentPage,
    data,
  ];

}

class DataDetails extends Equatable
{
  final int id;
  final String title;
  final String message;

  const DataDetails({
    required this.id,
    required this.title,
    required this.message,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    message,
  ];

}