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
import 'package:home_service_application/features/auth/presentation/controller/register_controller.dart';
import 'package:home_service_application/routes/routes.dart';

class RegisterView extends StatelessWidget {
  final FieldValidator _failedValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
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
                          ManagerStrings.register,
                          style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s34,
                            color: ManagerColors.black,
                          ),
                        ),
                        const SizedBox(height: 3,),
                        Container(
                          width: ManagerWidth.w116,
                          height: ManagerHeight.h4,
                          decoration: const BoxDecoration(
                            color: ManagerColors.primaryColor,
                            borderRadius: BorderRadiusDirectional.only(
                              bottomStart: Radius.circular(25),
                              bottomEnd: Radius.circular(25),
                            ),

                          ),
                        ),
                        const SizedBox(height: 30,),
                        baseTextFormField(
                          controller: controller.name,
                          hintText: ManagerStrings.name,
                          keyboardType: TextInputType.text,
                          validator: (value) => _failedValidator.validateFullName(
                            value,
                          ),
                        ),
                        const SizedBox(height: 25,),
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
                        const SizedBox(height: 25,),
                        baseTextFormField(
                          controller: controller.phone,
                          hintText: ManagerStrings.phone,
                          keyboardType: TextInputType.number,
                          validator: (value) => _failedValidator.validatePhone(
                            value,
                          ),
                        ),
                        SizedBox(height: ManagerHeight.h50),
                        mainButton(
                            child: Text(
                              ManagerStrings.signup,
                              style: getBoldTextStyle(
                                fontSize: ManagerFontSize.s18,
                                color: ManagerColors.white,
                              ),
                            ),
                            minWidth: double.infinity,
                            color: ManagerColors.primaryColor,
                            height: ManagerHeight.h44,
                            onPressed: () {
                              if(controller.formKey.currentState!.validate()){
                                controller.register(context);
                              }
                            }
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ManagerStrings.haveAccount,
                              style: getBoldTextStyle(
                                  fontSize: ManagerFontSize.s14,
                                  color: ManagerColors.black),
                            ),
                            mainButton(
                                child: Text(
                                  ManagerStrings.signIn,
                                  style: getBoldTextStyle(
                                    fontSize: ManagerFontSize.s14,
                                    color: ManagerColors.primaryColor,
                                  ),
                                ),
                                onPressed: () {
                                  Get.offAllNamed(Routes.loginView);
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
