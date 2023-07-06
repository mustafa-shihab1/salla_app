import 'package:flutter/material.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';

class SettingsView extends StatelessWidget {
  SettingsView({Key? key}) : super(key: key);
  List<String> tab_names = [
    'Change Password','FAQ\'s','About App',
    'Terms & Conditions','Privacy Policy',
    'Rate App','Delete Account',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.white,
      body: ListView.separated(
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
          child: Container(width: double.infinity,color: Colors.grey[200],height: 1.0,),
        ),
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
          width: double.infinity,
          child: Row(
              children: [
                Text(tab_names[index],
                  style: getBoldTextStyle(fontSize: ManagerFontSize.s18, color: ManagerColors.black),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios_outlined,size: 20,),
              ],
          ),
        ),
            ),
        itemCount: tab_names.length,

      ),
    );
  }
}