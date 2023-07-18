import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/features/search/domain/model/product_data_model.dart';
import 'package:home_service_application/features/search/domain/model/search_model.dart';
import 'package:home_service_application/features/search/domain/use_case/search_usecase.dart';

class SearchsController extends GetxController {

  late TextEditingController searchController = TextEditingController();
  late final SearchUseCase _searchUseCase = instance<SearchUseCase>();
  final List<ProductData> searchList = [];


  Future<void> search(BuildContext context) async {
    (await _searchUseCase.execute(
      SearchUseCaseInput(text: searchController.text),
    ))
        .fold((l) {

    }, (r) {
      searchList.clear();
      r.data!.data!.forEach((element) {
        searchList.add(element);
        update();
      });
    });
  }

}