import 'package:get/get.dart';
import 'package:kurumsal_mobil/features/onboard/controller/onboard_controller.dart';

class OnBoardPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardController());
  }
}
