import 'package:dartz/dartz.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}