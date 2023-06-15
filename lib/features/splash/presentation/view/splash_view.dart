import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_service_application/core/resources/manager_assets.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SvgPicture.asset(ManagerAssets.logo,color: ManagerColors.primaryColor,),
      ),
    );
  }
}
