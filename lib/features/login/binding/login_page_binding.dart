import 'package:get/get.dart';
import 'package:kurumsal_mobil/features/login/controller/login_page_controller.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
  }
}
