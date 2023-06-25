import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_handler.dart';
import '../../data/request/login_request.dart';
import '../model/login.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> login(LoginRequest loginRequest);
}