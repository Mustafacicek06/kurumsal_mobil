class AppNavigation {
  static AppNavigation instance = AppNavigation._();

  AppNavigation._();

  static const String splash = "/splash";
  static const String onboard = "/onboard";
  static const String login = "/login";
  static const String home = "/home";

  static const int mainNestedKey = 1;
}

class MainNestedNavigation {
  MainNestedNavigation._();

  static const String explore = "/";
  static const String messages = "/messages";
  static const String profile = "/profile";
}
