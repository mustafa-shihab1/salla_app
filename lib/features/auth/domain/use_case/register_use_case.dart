import 'package:dartz/dartz.dart';
import 'package:home_service_application/core/error_handler/error_handler.dart';
import 'package:home_service_application/core/use_case/base_use_case.dart';
import 'package:home_service_application/features/auth/data/request/register_request.dart';
import 'package:home_service_application/features/auth/domain/model/register_model.dart';
import 'package:home_service_application/features/auth/domain/repository/register_repository.dart';

class RegisterUseCaseInput {
  String? email;
  String? password;
  String? name;
  String? phone;

  RegisterUseCaseInput({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });
}
class RegisterUseCase implements BaseUseCase<RegisterUseCaseInput, Register> {
  final RegisterRepository _loginRepository;

  RegisterUseCase(this._loginRepository);

  @override
  Future<Either<Failure, Register>> execute(RegisterUseCaseInput input) async {
    return await _loginRepository.register(
      RegisterRequest(
        email: input.email,
        password: input.password,
        name: input.name,
        phone: input.phone,
      ),
    );
  }
}