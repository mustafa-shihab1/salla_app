import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/features/home/domain/model/home_data_model.dart';
import 'package:home_service_application/features/home/domain/model/products_model.dart';
import 'package:home_service_application/features/home/domain/use_case/home_usecase.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late CarouselController carouselController;
  int current = 0;
  int index = 0;

  HomeDataModel? homeDataModel;
  List<String?> names = [];
  List<String?> images = [];
  final HomeUseCase _homeUseCase = instance<HomeUseCase>();

  @override
  void onInit() {
    super.onInit();
    home();
    carouselController = CarouselController();
  }

  changeFavorites(ProductsModel model){
    if(model.in_favorites == false){
      model.in_favorites = !model.in_favorites!;
      names.add(model.name!);
      images.add(model.image!);
    }else{
      model.in_favorites = !model.in_favorites!;
      names.remove(model.name);
      images.remove(model.image);
    }
    update();
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
      index++;
      update();
    });
  }

}
