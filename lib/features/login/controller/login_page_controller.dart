import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kurumsal_mobil/product/navigation/app_navigation.dart';

class LoginPageController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void loginButtonOnTap() async {
    // login control
    // and then home page

    await Get.toNamed(
      AppNavigation.home,
    );
  }

  static const String loginPageObserveID = "login_page_observe_id";
}
