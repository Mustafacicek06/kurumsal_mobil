import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:kurumsal_mobil/core/init/manager/local_manager.dart';
import 'package:kurumsal_mobil/product/navigation/app_navigation.dart';

class OnBoardController extends GetxController {
  void onDone() async {
    await LocalManager.instance.setUserFirstTime(false);
    Get.offAllNamed(AppNavigation.login);
  }

  static const String onBoardObserveId = "onboard_observe_id";
}
