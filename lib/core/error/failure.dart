import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServeFailure extends Failure
{
  const ServeFailure(super.message);

}

class LocalDataBaseFailure extends Failure
{
  const LocalDataBaseFailure(super.message);

}