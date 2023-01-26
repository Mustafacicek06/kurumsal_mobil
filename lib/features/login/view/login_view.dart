import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kurumsal_mobil/core/components/animation/slide_transition_container.dart';
import 'package:kurumsal_mobil/core/components/columnWithSpacing/column_with_spacing.dart';
import 'package:kurumsal_mobil/core/init/theme/app_color_service.dart';
import 'package:kurumsal_mobil/features/home/subPages/selectionMouleScreen.dart';
import 'package:kurumsal_mobil/features/login/controller/login_page_controller.dart';
import 'package:kurumsal_mobil/features/login/view/components/login_text_field.dart';

import 'package:kurumsal_mobil/product/constants/assetsPath/assets_path.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginText = "Hoşgeldiniz";

    return Scaffold(
      body: GetBuilder<LoginPageController>(
          id: LoginPageController.loginPageObserveID,
          init: controller,
          builder: (_) {
            return SafeArea(
              child: Column(children: [
                Expanded(
                    child: SlideTransitionContainer(
                        begin: const Offset(-1, 0),
                        child: Image.asset(AssetsPath.alisanLOGO))),
                Expanded(
                    child: Text(
                  loginText,
                  style: Theme.of(context).textTheme.headline4,
                )),
                Expanded(
                  flex: 3,
                  child: Form(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: ColumnWithSpacing(
                      space: 15.h,
                      children: [
                        LoginTextField(
                          hintText: "Email",
                          prefixIcon: Icons.email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email alanı boş bırakılamaz";
                            }
                          },
                        ),
                        LoginTextField(
                          hintText: "Password",
                          prefixIcon: Icons.password,
                          isPasswordTextField: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email alanı boş bırakılamaz";
                            }
                          },
                        ),
                        InkWell(
                            onTap: () {
                              // LoginPageController.forgotPasswordOntap();
                            },
                            child: Text("Forgot Password?")),
                        SlideTransitionContainer(
                          begin: const Offset(-1, 0),
                          child: buildLoginButton(
                            context,
                            Icons.phone,
                            "Giriş Yap",
                            () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        selectionModuleScreen()))),
                          ),
                        ),
                      ],
                    ),
                  )),
                )
              ]),
            );
          }),
    );
  }

  ElevatedButton buildLoginButton(
      BuildContext context, IconData icon, String text, Function() onTap) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorService.primary,
          minimumSize: Size(125.w, 40.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        ),
        child: Text(text));
  }
}
