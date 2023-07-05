import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/features/home/domain/model/home_data_model.dart';
import 'package:home_service_application/features/home/domain/use_case/home_usecase.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late CarouselController carouselController;
  int selectedCategoryIndex = 0;
  int current = 0;

  HomeDataModel? homeDataModel ;


  final HomeUseCase _homeUseCase = instance<HomeUseCase>();

  @override
  void onInit() {
    super.onInit();
    home();
    carouselController = CarouselController();
  }

  void change(int index) {
    current = index;
    update();
  }


  Future<void> home() async {
    BuildContext context = Get.context as BuildContext;
    (await _homeUseCase.execute()).fold((l) {
      dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpErrorState,
          message: l.message,
          title: '',
          retryAction: () {
            Get.back();
          });
    }, (r) {
      homeDataModel = r.data;
      update();
    });
  }

}
