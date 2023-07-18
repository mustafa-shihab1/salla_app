import 'package:home_service_application/features/search/data/response/product_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_search_response.g.dart';


@JsonSerializable()
class DataResponse {
  @JsonKey(name: 'currentPage')
  int? currentPage;

  @JsonKey(name: 'data')
  List<ProductDataResponse>? data;

  @JsonKey(name: 'firstPageUrl')
  String? firstPageUrl;

  @JsonKey(name: 'from')
  int? from;

  @JsonKey(name: 'lastPage')
  int? lastPage;

  @JsonKey(name: 'lastPageUrl')
  String? lastPageUrl;

  @JsonKey(name: 'nextPageUrl')
  String? nextPageUrl;

  @JsonKey(name: 'path')
  String? path;

  @JsonKey(name: 'perPage')
  int? perPage;

  @JsonKey(name: 'prevPageUrl')
  String? prevPageUrl;

  @JsonKey(name: 'to')
  int? to;

  @JsonKey(name: 'total')
  int? total;

  DataResponse({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });


  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}