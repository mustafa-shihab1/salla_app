import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/features/search/presentation/controller/search_controller.dart';
import 'package:home_service_application/features/search/presentation/view/widget/custom_search_item.dart';
import 'package:home_service_application/features/search/presentation/view/widget/custom_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ManagerColors.white,
          appBar: AppBar(
            backgroundColor: ManagerColors.transparent,
            elevation: 0,
            title: Text(
              'Search',
              style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s18,
                  color: ManagerColors.black,
              ),
            ),

            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  controller.searchController.clear();
                  controller.searchList.clear();
                  Get.back();
                }, icon: const Icon(Icons.arrow_back_ios),color: ManagerColors.boldGrey,),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: ManagerHeight.h40,),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 42,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1, color: ManagerColors.lightGrey)),
                  child: CustomTextField(
                    controller: controller.searchController,
                    onSubmitted: (value) {
                      controller.search(context);
                    },
                    hintText: 'Search',
                    prefixIcon: Icons.search,
                    iconColor: ManagerColors.lightGrey,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                controller.searchList.isEmpty
                    ? Center(
                  child: Text('Search for products', style: getBoldTextStyle(fontSize: 18, color: ManagerColors.grey)),
                )
                    : Expanded(

                  child: ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          // Get.toNamed(ProfileScreen.route, arguments: {
                          //   'name': "${controller.searchList[index].name}",
                          // });
                        },
                        child: CustomSearchItem(
                            name: "${controller.searchList[index].name}", image: "${controller.searchList[index].image}",),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 14,
                      ),
                      itemCount: controller.searchList.length
                  ),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
