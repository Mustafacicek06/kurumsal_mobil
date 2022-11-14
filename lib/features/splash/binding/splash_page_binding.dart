import 'package:get/get.dart';
import 'package:kurumsal_mobil/features/splash/controller/splash_controller.dart';

class SplashPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
