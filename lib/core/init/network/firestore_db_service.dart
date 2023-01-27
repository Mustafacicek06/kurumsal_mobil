import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:kurumsal_mobil/core/init/model/it_request.dart';
import 'package:kurumsal_mobil/core/init/model/user_model.dart';

class FireStoreDBService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> saveUser(UserModel userModel) async {
    // document'i okumak
    DocumentSnapshot _readUser =
        await FirebaseFirestore.instance.doc("users/${userModel.userID}").get();

    // okunan kullanıcı daha onceden veri tabanında yoksa

    if (_readUser.data() == null) {
      // böyle ekleyemezsin.
      // UserModel _addingUser = userModel;
      // _addingUser.createdAt = FieldValue.serverTimestamp();

      await _firestore
          .collection("users")
          .doc(userModel.userID)
          .set(userModel.toMap());
    }

    return true;
  }

  Future<bool> saveITRequest(ItRequest requestModel) async {
    var randVal = Random().nextInt(10000);

    await _firestore
        .collection("request")
        .doc(requestModel.userID)
        .set(requestModel.toJson());

    return true;
  }

  Future<ItRequest> getITRequest(String userID) async {
    DocumentSnapshot _readUser =
        await _firestore.collection("request").doc(userID).get();
    Map<String, dynamic> _readUserInfoMap =
        _readUser.data() as Map<String, dynamic>;

    ItRequest _readUserObject = ItRequest.fromJson(_readUserInfoMap);
    debugPrint('okunan user nesnesi : ' + _readUserObject.toString());
    return _readUserObject;
  }

  Future<UserModel> readUser(String userID) async {
    DocumentSnapshot _readUser =
        await _firestore.collection("users").doc(userID).get();
    Map<String, dynamic> _readUserInfoMap =
        _readUser.data() as Map<String, dynamic>;

    UserModel _readUserObject = UserModel.fromMap(_readUserInfoMap);
    debugPrint('okunan user nesnesi : ' + _readUserObject.toString());
    return _readUserObject;
  }
}
