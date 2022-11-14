import 'package:get/get.dart';
import 'package:kurumsal_mobil/features/home/controller/home_page_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
