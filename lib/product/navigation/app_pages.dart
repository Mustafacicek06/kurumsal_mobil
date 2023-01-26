import 'package:get/get.dart';
import 'package:kurumsal_mobil/features/home/binding/home_page_binding.dart';
import 'package:kurumsal_mobil/features/home/view/home_page.dart';
import 'package:kurumsal_mobil/features/login/binding/login_page_binding.dart';
import 'package:kurumsal_mobil/features/login/view/login_view.dart';
import 'package:kurumsal_mobil/features/onboard/bindings/onboard_page_binding.dart';
import 'package:kurumsal_mobil/features/onboard/view/onboard_page.dart';
import 'package:kurumsal_mobil/features/splash/binding/splash_page_binding.dart';
import 'package:kurumsal_mobil/features/splash/view/splash_page.dart';
import 'package:kurumsal_mobil/product/navigation/app_navigation.dart';

class AppPages {
  AppPages._();

  static const String initial = AppNavigation.splash;

  static final List<GetPage> pages = [
    GetPage(
      name: AppNavigation.splash,
      page: () => const SplashPage(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: AppNavigation.onboard,
      page: () => const OnBoardPage(),
      binding: OnBoardPageBinding(),
    ),
    GetPage(
      name: AppNavigation.login,
      page: () => const LoginPage(),
      binding: LoginPageBinding(),
    ),
    // GetPage(
    //   name: AppNavigation.home,
    //   page: () => const HomePage(),
    //   binding: HomePageBinding(),
    // ),
  ];
}
