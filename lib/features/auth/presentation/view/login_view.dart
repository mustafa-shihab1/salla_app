import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_service_application/core/resources/manager_colors.dart';
import 'package:home_service_application/core/resources/manager_fonts.dart';
import 'package:home_service_application/core/resources/manager_sizes.dart';
import 'package:home_service_application/core/resources/manager_strings.dart';
import 'package:home_service_application/core/resources/manager_styles.dart';
import 'package:home_service_application/core/validator/validator.dart';
import 'package:home_service_application/core/widgets/base_text_form_field.dart';
import 'package:home_service_application/core/widgets/header_widget.dart';
import 'package:home_service_application/core/widgets/main_button.dart';
import 'package:home_service_application/features/auth/presentation/controller/login_controller.dart';
import 'package:home_service_application/routes/routes.dart';

class LoginView extends StatelessWidget {
  final FieldValidator _failedValidator = FieldValidator();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          body: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 200, child: HeaderWidget(200)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(
                          ManagerRadius.r44,
                        ),
                        topEnd: Radius.circular(
                          ManagerRadius.r44,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ManagerWidth.w16,
                      vertical: ManagerHeight.h40,
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ManagerStrings.login,
                          style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s34,
                            color: ManagerColors.black,
                          ),
                        ),
                        const SizedBox(height: 3,),
                        Container(
                          width: ManagerWidth.w80,
                          height: ManagerHeight.h4,
                          decoration: const BoxDecoration(
                            color: ManagerColors.primaryColor,
                            borderRadius: BorderRadiusDirectional.only(
                              bottomStart: Radius.circular(25),
                              bottomEnd: Radius.circular(25),
                            ),

                          ),
                        ),
                        const SizedBox(height: 15,),
                        Text(
                          ManagerStrings.loginDescription,
                          style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s18,
                            color: ManagerColors.boldGrey,
                          ),
                        ),
                        const SizedBox(height: 30,),
                        baseTextFormField(
                          controller: controller.email,
                          hintText: ManagerStrings.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => _failedValidator.validateEmail(
                            value,
                          ),
                        ),
                        const SizedBox(height: 25,),
                        baseTextFormField(
                          controller: controller.password,
                          hintText: ManagerStrings.password,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          validator: (value) => _failedValidator.validatePassword(
                            value,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            const SizedBox(width: 10,),
                            Text(
                              ManagerStrings.forgotPassword,
                              style: getBoldTextStyle(
                                fontSize: ManagerFontSize.s16,
                                color: ManagerColors.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 10,)
                          ],
                        ),
                        SizedBox(height: ManagerHeight.h40),
                        mainButton(
                          padding: EdgeInsets.symmetric(vertical: ManagerHeight.h16),
                            child: Text(
                              ManagerStrings.login,
                              style: getBoldTextStyle(
                                fontSize: ManagerFontSize.s22,
                                color: ManagerColors.white,
                              ),
                            ),
                            minWidth: double.infinity,
                            color: ManagerColors.primaryColor,
                            height: ManagerHeight.h44,
                            onPressed: () {
                              if(controller.formKey.currentState!.validate()){
                                controller.login(context);
                              }
                            }
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ManagerStrings.notHaveAccount,
                              style: getBoldTextStyle(
                                  fontSize: ManagerFontSize.s16,
                                  color: ManagerColors.black),
                            ),
                            mainButton(
                                child: Text(
                                  ManagerStrings.signup,
                                  style: getBoldTextStyle(
                                    fontSize: ManagerFontSize.s16,
                                    color: ManagerColors.primaryColor,
                                  ),
                                ),
                                onPressed: () {
                                   Get.offAllNamed(Routes.registerView);
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
