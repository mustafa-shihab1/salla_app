import 'package:dartz/dartz.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/features/profile/domain/model/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();
}