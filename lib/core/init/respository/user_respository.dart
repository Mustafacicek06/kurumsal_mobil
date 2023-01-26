import 'package:kurumsal_mobil/core/init/model/user_model.dart';
import 'package:kurumsal_mobil/core/init/network/firebase_auth_service.dart';
import 'package:kurumsal_mobil/core/init/network/firestore_db_service.dart';

class UserRepository {
  // firebase ' e mi gideyim fake e mi gideyim ?

  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  final FireStoreDBService _fireStoreDBService = FireStoreDBService();

  List<UserModel> allUserList = [];

  Future<UserModel?> currentUser() async {
    UserModel _user = await _firebaseAuthService.currentUser();
    if (_user != null) {
      return await _fireStoreDBService.readUser(_user.userID);
    }
    return null;
  }

  Future<bool> signOut() async {
    return await _firebaseAuthService.signOut();
  }

  @override
  Future<UserModel> createUserWithEmailandPassword(
      String eMail, String sifre) async {
    UserModel _user =
        await _firebaseAuthService.createUserWithEmailandPassword(eMail, sifre);
    bool _result = await _fireStoreDBService.saveUser(_user);
    if (_result) {
      return await _fireStoreDBService.readUser(_user.userID);
    } else {
      return _user;
    }
  }

  @override
  Future<UserModel> signInWithEmailandPassword(
      String eMail, String sifre) async {
    UserModel? _userModel =
        await _firebaseAuthService.signInWithEmailandPassword(eMail, sifre);
    return await _fireStoreDBService.readUser(_userModel.userID);
  }
}
