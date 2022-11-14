import 'package:hive_flutter/hive_flutter.dart';

class LocalManager {
  static LocalManager instance = LocalManager._();

  LocalManager._();

  late Box _userBox;
  bool isStorageInitialized = false;

  Future<void> initializeHive() async {
    await Hive.initFlutter();

    _userBox = await Hive.openBox(_LocalManagerKeys.userBoxName);
    await _increaseAppOpenedCount();

    isStorageInitialized = true;
  }

  //showing on board page check
  bool get isUserFirstTime =>
      _userBox.get(_LocalManagerKeys.userFirstTime, defaultValue: true);

  Future<void> setUserFirstTime(bool value) async {
    await _userBox.put(_LocalManagerKeys.userFirstTime, value);
  }

  //authorization
  String get token =>
      _userBox.get(_LocalManagerKeys.userJsonToken, defaultValue: "");

  Future<void> setToken(String value) async {
    await _userBox.put(_LocalManagerKeys.userJsonToken, value);
  }

  //register completed
  bool get isUserBeforeLogin =>
      _userBox.get(_LocalManagerKeys.isUserBeforeLogin, defaultValue: false);

  Future<void> setRegisterCompleted(bool value) async {
    await _userBox.put(_LocalManagerKeys.isUserBeforeLogin, value);
  }

  //userId
  String get userId => _userBox.get(_LocalManagerKeys.userId, defaultValue: "");

  Future<void> setUserId(String value) async {
    await _userBox.put(_LocalManagerKeys.userId, value);
  }

  //userId
  int get appOpenedCount =>
      _userBox.get(_LocalManagerKeys.appOpenedCount, defaultValue: 0);

  Future<void> _increaseAppOpenedCount() async {
    await _userBox.put(_LocalManagerKeys.appOpenedCount, (appOpenedCount + 1));
  }

  Future<void> clearUserBox() async {
    final isFirstTime = isUserFirstTime;
    await _userBox.clear();
    await _userBox.put(_LocalManagerKeys.userFirstTime, isFirstTime);
    await setUserFirstTime(isFirstTime);
  }
}

class _LocalManagerKeys {
  _LocalManagerKeys._();

  //user box
  static const String userBoxName = "user_box";
  static const String userFirstTime = "first_time";
  static const String userJsonToken = "authorization_json_token";
  static const String userId = "user_id";
  static const String appOpenedCount = "app_opened_count";
  static const String isUserBeforeLogin = "is_user_before_login";
}
