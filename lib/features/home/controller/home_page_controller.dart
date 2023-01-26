import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurumsal_mobil/features/login/controller/login_page_controller.dart';

class HomePageController extends GetxController {
  var isLoading = false.obs;

  @override
  void onInit() async {
    await getUser();

    getUserData();

    super.onInit();
  }

  // asenkron  1-2-3-4-5
  // senkron 1-2-3-4-5
  // senkron 5-3-1-2-4

  Future getUser() async {
    //  await HomeService.getuser();
  }

  void getPage() {}

  getUserData() async {
    isLoading.value = true;
    update([
      LoginPageController.loginPageObserveID,
      HomePageController.homePageObserveID
    ]);

    // await HomeService.getData();

    isLoading.value = false;
    update([
      LoginPageController.loginPageObserveID,
      HomePageController.homePageObserveID
    ]);
  }

  static const String homePageObserveID = "home_page_observe_id";
}
