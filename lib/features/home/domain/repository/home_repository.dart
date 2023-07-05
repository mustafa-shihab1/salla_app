import 'package:dartz/dartz.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/features/home/domain/model/home_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> home();
}