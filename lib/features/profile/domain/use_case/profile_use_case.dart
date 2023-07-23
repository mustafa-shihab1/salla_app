import 'package:dartz/dartz.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/core/use_case/base_use_case.dart';
import 'package:home_service_application/features/profile/data/request/update_profile_request.dart';
import 'package:home_service_application/features/profile/domain/model/profile_model.dart';
import 'package:home_service_application/features/profile/domain/repository/profile_repository.dart';


class ProfileUseCase implements BaseOutUseCase {
  final ProfileRepository _profileRepository;

  ProfileUseCase(this._profileRepository);

  @override
  Future<Either<Failure, Profile>> execute() async {
    return await _profileRepository.getProfile();
  }

}

class UpdateProfileUseCaseInput {
  String? name;
  String? email;
  String? phone;
  //String? password;

  UpdateProfileUseCaseInput({
    required this.name,
    required this.email,
    required this.phone,
    //required this.password,
  });
}

class UpdateProfileUseCase implements BaseUseCase{
  final ProfileRepository _updateRepository;

  UpdateProfileUseCase(this._updateRepository);

  @override
  Future<Either<Failure, Profile>> execute(
      dynamic input
      ) async {
    return await _updateRepository.updateProfile(
      UpdateProfileRequest(
        email: input.email,
        name: input.name,
        phone: input.phone,
      ),
    );
  }

}