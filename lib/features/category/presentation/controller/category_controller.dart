import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/features/category/domain/model/category_data_model.dart';
import 'package:home_service_application/features/category/domain/use_case/category_usecase.dart';

class CategoryController extends GetxController{
  CategoryDataModel? categoryDataModel ;

  final CategoryUseCase _categoryUseCase = instance<CategoryUseCase>();


  @override
  void onInit() {
    super.onInit();
    category();
  }

  Future<void> category() async {
    BuildContext context = Get.context as BuildContext;
    (await _categoryUseCase.execute()).fold((l) {
      dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpErrorState,
          message: l.message,
          title: '',
          retryAction: () {
            Get.back();
          });
    }, (r) {
      categoryDataModel = r.categoryData!;
      update();
    });
  }

}