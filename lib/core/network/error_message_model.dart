import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final bool status;
  final String message;
  final int statusCode;

  const ErrorMessageModel({
    required this.status,
    required this.message,
    required this.statusCode,
  });

  factory ErrorMessageModel.fromJson(Map<String,dynamic>json)
  {
    return ErrorMessageModel(
      status: json['status'],
      message: json['message'],
      statusCode: json['code'],
    );
  }

  @override
  List<Object?> get props => [
    status,
    message,
    statusCode,
  ];
}
