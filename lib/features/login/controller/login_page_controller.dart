import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kurumsal_mobil/core/components/dialog/platform_responsive_alert_dialog.dart';
import 'package:kurumsal_mobil/core/init/model/user_model.dart';
import 'package:kurumsal_mobil/core/init/respository/user_respository.dart';
import 'package:kurumsal_mobil/product/navigation/app_navigation.dart';

class LoginPageController extends GetxController {
  final UserRepository _userRepository = UserRepository();

  var user = UserModel().obs;
  var emailErrorMessage = ''.obs;
  var passwordErrorMessage = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<UserModel?> currentUser() async {
    try {
      user.value = await _userRepository.currentUser() ?? UserModel();
      if (user != null) {
        return user.value;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Viewmodeldeki currentUser da hata ' + e.toString());
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      bool result = await _userRepository.signOut();
      user.value = UserModel();
      return result;
    } catch (e) {
      debugPrint('Viewmodeldeki signOut da hata ' + e.toString());
      return false;
    }
  }

  Future<UserModel?> createUserWithEmailandPassword(
      String eMail, String sifre) async {
    if (_emailSifreKontrol(eMail, sifre)) {
      try {
        user.value =
            await _userRepository.createUserWithEmailandPassword(eMail, sifre);

        return user.value;
      } catch (e) {
        debugPrint('hata createUserWithMail in userview model' + e.toString());
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<UserModel> signInWithEmailandPassword(
      String eMail, String sifre, BuildContext context) async {
    try {
      if (_emailSifreKontrol(eMail, sifre)) {
        user.value =
            await _userRepository.signInWithEmailandPassword(eMail, sifre);
        return user.value;
      } else {
        PlatformResponsiveAlertDialog(
          anaButonYazisi: "Tamam",
          baslik: "Oturum Açma Hata",
          icerik: passwordErrorMessage.value != ''
              ? passwordErrorMessage.value
              : emailErrorMessage.value,
        ).myShowMethod(context);
        return user.value;
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('hata signInWithMail in userview model' + e.toString());
      PlatformResponsiveAlertDialog(
        anaButonYazisi: "Ok",
        baslik: "Login Error",
        icerik: e.message.toString(),
      ).myShowMethod(context);
      return user.value;
    }

    // her iki durumda'da burası çalışacak.
  }

  bool _emailSifreKontrol(String email, String sifre) {
    bool result = true;
    if (sifre.length < 6) {
      passwordErrorMessage.value = "En az 6 karakter olmalı";
      result = false;
    } else {
      passwordErrorMessage.value = '';
    }
    if (!email.contains('@')) {
      emailErrorMessage.value = "Geçersiz E-mail adresi";
      result = true;
    } else {
      emailErrorMessage.value = '';
    }

    return result;
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
