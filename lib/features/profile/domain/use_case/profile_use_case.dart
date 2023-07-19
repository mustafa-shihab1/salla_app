import 'package:dartz/dartz.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/core/use_case/base_use_case.dart';
import 'package:home_service_application/features/profile/domain/model/profile_model.dart';
import 'package:home_service_application/features/profile/domain/repository/profile_repository.dart';


class ProfileUseCase implements BaseOutUseCase {
  final ProfileRepository _categoryRepository;

  ProfileUseCase(this._categoryRepository);

  @override
  Future<Either<Failure, Profile>> execute() async {
    return await _categoryRepository.getProfile();
  }
}