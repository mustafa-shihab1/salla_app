import 'package:dartz/dartz.dart';
import 'package:home_service_application/features/auth/data/request/register_request.dart';
import 'package:home_service_application/features/auth/domain/model/register_model.dart';
import '../../../../core/error_handler/error_handler.dart';

abstract class RegisterRepository {
  Future<Either<Failure, Register>> register(RegisterRequest registerRequest);
}