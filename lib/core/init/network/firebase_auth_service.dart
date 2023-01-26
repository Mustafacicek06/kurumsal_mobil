import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

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
