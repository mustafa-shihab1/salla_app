import 'package:home_service_application/config/dependency_injection.dart';
import 'package:home_service_application/features/home/domain/model/home_data_model.dart';
import 'package:home_service_application/features/home/domain/model/products_model.dart';
import 'package:home_service_application/features/home/domain/use_case/home_usecase.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:get/get.dart';
import 'package:home_service_application/features/product_details/presentation/view/product_details_view.dart';
import 'package:home_service_application/routes/routes.dart';

class HomeController extends GetxController {
  late CarouselController carouselController;
  final HomeUseCase _homeUseCase = instance<HomeUseCase>();
  HomeDataModel? homeDataModel;

  int current = 0;
  int index = 0;
  List<String?> names = [];
  List<String?> images = [];

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

  getFavorites(){
    if(homeDataModel!.products!.isNotEmpty){
      for(int i = 0; i < homeDataModel!.products!.length; i++){
        if(homeDataModel!.products![i].in_favorites == true){
          names.add(homeDataModel!.products![i].name!);
          images.add(homeDataModel!.products![i].image!);
        }
      }
    }
  }

  void change(int index) {
    current = index;
    update();
  }

  void navigateToProductDetails(ProductsModel model ) {
    Get.to(() => ProductDetailsView(productsModel: model,));
    //Get.toNamed(Routes.productDetailsView);
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
      getFavorites();
      update();
    });
  }

}
