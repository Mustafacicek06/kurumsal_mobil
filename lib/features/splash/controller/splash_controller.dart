import 'package:get/get.dart';
import 'package:kurumsal_mobil/core/init/manager/local_manager.dart';
import 'package:kurumsal_mobil/product/navigation/app_navigation.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    _checkUser();
    super.onReady();
  }

  void _checkUser() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    if (LocalManager.instance.isUserFirstTime) {
      Get.offAllNamed(AppNavigation.onboard);
    } else {
      checkUserLoggedIn();
    }
  }

  void checkUserLoggedIn() {
    if (isUserLogged()) {
      if (LocalManager.instance.isUserBeforeLogin) {
        Get.offAllNamed(AppNavigation.home);
      } else {
        Get.offAllNamed(AppNavigation.login);
      }
    } else {
      Get.offAllNamed(AppNavigation.login);
    }
  }

  bool isUserLogged() {
    final token = LocalManager.instance.token;
    if (token.isEmpty) {
      return false;
    }

    //final decoded = JwtDecoder.decode(token);
    // LoggerUtil.instance.d(decoded.toString());

    return true;
  }

  static const String splashPageObserveID = "splash_page_observe_id";
}
