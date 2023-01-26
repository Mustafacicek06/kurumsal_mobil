import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:kurumsal_mobil/core/init/model/user_model.dart';

class FirebaseAuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel> currentUser() async {
    User? user = await _firebaseAuth.currentUser;
    debugPrint('firebase user : ' + user.toString());
    return _userFromFirebase(user);
    //   try {
    // } catch (e) {
    //   print('HATA CURRENT USER ' + e.toString());
    //   return null;
    // }
  }

  UserModel _userFromFirebase(User? user) {
    // if (user == null) {
    //   return null;
    // } else {
    //
    // }
    return UserModel(userID: user!.uid, email: user.email!);
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      debugPrint('Sign out hata : ' + e.toString());
      return false;
    }
  }

  Future<UserModel> createUserWithEmailandPassword(
      String eMail, String sifre) async {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: eMail, password: sifre);
    return _userFromFirebase(result.user!);
  }

  Future<UserModel> signInWithEmailandPassword(
      String eMail, String sifre) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: eMail, password: sifre);
    return _userFromFirebase(result.user!);
  }
}
// null safety unsupported
// final _facebookLogin = FacebookLogin();
    // FacebookLoginResult _faceResult =
    //     await _facebookLogin.logIn(['public_profile', 'email']);

    // switch (_faceResult.status) {
    //   case FacebookLoginStatus.error:
    //     print('Hata cikti : ' + _faceResult.errorMessage);
    //     break;

    //   case FacebookLoginStatus.loggedIn:
    //     if (_faceResult.accessToken != null) {
    //       UserCredential userCredential = await _firebaseAuth
    //           .signInWithCredential(FacebookAuthProvider.credential(
    //               _faceResult.accessToken.token));
    //       User? _user = userCredential.user;
    //       return _userFromFirebase(_user);
    //     }

    //     break;

    //   case FacebookLoginStatus.cancelledByUser:
    //     print('Kullanıcı girişi iptal etti.');
    //     break;
    // }