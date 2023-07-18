import 'package:home_service_application/config/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: ApiConstants.message)
  String? message;
}
