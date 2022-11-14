import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kurumsal_mobil/features/splash/controller/splash_controller.dart';
import 'package:kurumsal_mobil/product/constants/assetsPath/assets_path.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<SplashController>(
        id: SplashController.splashPageObserveID,
        init: controller,
        builder: (_) => Center(
          child: Hero(
            tag: AssetsPath.alisanLOGO,
            child: Image.asset(
              AssetsPath.alisanLOGO,
              width: 200.w,
              height: 200.h,
            ),
          ),
        ),
      ),
    );
  }
}
