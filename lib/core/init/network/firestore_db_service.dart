import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:kurumsal_mobil/core/init/model/user_model.dart';

class FireStoreDBService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
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
