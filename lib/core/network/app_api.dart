import 'dart:io';

import 'package:home_service_application/features/auth/data/response/register_response.dart';
import 'package:home_service_application/features/cart/data/response/add_remove_cart_response.dart';
import 'package:home_service_application/features/cart/data/response/cart_response.dart';
import 'package:home_service_application/features/category/data/response/category_response.dart';
import 'package:home_service_application/features/home/data/response/home_response.dart';
import 'package:home_service_application/features/search/data/response/search_response.dart';
import 'package:home_service_application/features/profile/data/response/profile_response.dart';
import 'package:retrofit/http.dart';
import '../../config/constants.dart';
import 'package:dio/dio.dart';

import '../../features/auth/data/response/login_response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppApi {
  factory AppApi(
      Dio dio, {
        String baseUrl,
      }) = _AppApi;

  @POST(RequestConstants.login)
  Future<LoginResponse> login(
      @Field(ApiConstants.email) email,
      @Field(ApiConstants.password) password
  );

  @POST(RequestConstants.register)
  Future<RegisterResponse> register(
      @Field(ApiConstants.name) name,
      @Field(ApiConstants.email) email,
      @Field(ApiConstants.password) password,
      @Field(ApiConstants.phone) phone,
      );

  @GET(RequestConstants.home)
  Future<HomeResponse> home();

  @GET(RequestConstants.categories)
  Future<CategoryResponse> category();

  @POST(RequestConstants.search)
  Future<SearchResponse> search(
      @Field(ApiConstants.text) text,
      );

  @GET(RequestConstants.getProfile)
  Future<ProfileResponse> getProfile();

  @POST(RequestConstants.updateProfile)
  Future<ProfileResponse> updateProfile(
      @Field(ApiConstants.name) name,
      @Field(ApiConstants.email) email,
      @Field(ApiConstants.phone) phone,
      );

  @GET(RequestConstants.carts)
  Future<CartResponse> getCart();

  @POST(RequestConstants.carts)
  Future<AddRemoveCartResponse> addOrRemove(
      @Field(ApiConstants.productId) productId,
      );

}