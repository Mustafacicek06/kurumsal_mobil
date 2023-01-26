import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Trans;

import 'package:introduction_screen/introduction_screen.dart';
import 'package:kurumsal_mobil/core/components/button/app_button.dart';
import 'package:kurumsal_mobil/core/init/theme/app_color_service.dart';
import 'package:kurumsal_mobil/features/onboard/controller/onboard_controller.dart';
import 'package:kurumsal_mobil/product/constants/assetsPath/assets_path.dart';

class OnBoardPage extends GetView<OnBoardController> {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: AppColorService.white,
      pages: [
        PageViewModel(
          title: "ALIŞAN Sigorta ve Aracılık Hizmetleri A.Ş.",
          body: "Riskleriniz bize emanet",
          image: buildImage(
            AssetsPath.onboard1,
          ),
          decoration: buildPageDecoration(context),
        ),
        PageViewModel(
          title: "Uluslararası Taşımacılık",
          body:
              "Türkiye’ den Avrupa, İskandinav Ülkeleri, Balkanlar ve Ortadoğu’ ya transit sevkiyatlarımızı 200’ ün üzerindeki araç filomuz ile yapmaktayız.",
          image: buildImage(
            AssetsPath.onboard2,
          ),
          decoration: buildPageDecoration(context),
        ),
      ],
      onDone: controller.onDone,
      showBackButton: false,
      showSkipButton: true,
      showNextButton: true,
      next: buildButton(context, "Next"),
      skip: buildButton(context, "Skip"),
      done: buildButton(context, "Done"),
      doneStyle: buildButtonStyle(context),
      nextStyle: buildButtonStyle(context),
      skipStyle: buildButtonStyle(context),
    );
  }

  ButtonStyle buildButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      overlayColor: MaterialStateProperty.all(
          context.theme.primaryColor.withOpacity(0.2)),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shape: MaterialStateProperty.all(const StadiumBorder()),
    );
  }

  PageDecoration buildPageDecoration(BuildContext context) {
    return PageDecoration(
      titleTextStyle: buildBodyTextStyle(context) ??
          TextStyle(
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w700,
            color: AppColorService.textPrimaryColor,
          ),
      bodyTextStyle: buildBodyTextStyle(context) ??
          TextStyle(
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w700,
            color: AppColorService.textPrimaryColor,
          ),
      imageFlex: 3,
      bodyFlex: 2,
      imagePadding: EdgeInsets.only(
        bottom: 0.h,
      ),
      titlePadding: EdgeInsets.symmetric(
        horizontal: 32.w,
      ),
      bodyPadding: EdgeInsets.symmetric(
        horizontal: 32.w,
      ),
      imageAlignment: Alignment.bottomCenter,
      bodyAlignment: Alignment.topCenter,
    );
  }

  Widget buildImage(String path) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 32.w,
          right: 32.w,
          top: 20.h,
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            path,
            fit: BoxFit.fitHeight,
            width: 300.w,
            height: 350.h,
          ),
        ),
      ),
    );
  }

  TextStyle? buildBodyTextStyle(BuildContext context) =>
      context.textTheme.titleSmall?.copyWith(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.w400,
        color: AppColorService.textPrimaryColor,
      );

  Widget buildButton(
    BuildContext context,
    String text,
  ) {
    return AppButton.fill(
      shape: AppButtonShape.pill,
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 8.w,
      ),
      margin: EdgeInsets.zero,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: context.textTheme.titleSmall?.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColorService.white,
          ),
        ),
      ),
    );
  }
}
