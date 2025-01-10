
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepository(this._firebaseAuthService);

  String? getUid(){
    return _firebaseAuthService.user?.uid;
  }


  Future<void> signUpWithEmail(String email, String password, String? name) async {
    try {
      await _firebaseAuthService.signUpWithEmail(
          email: email, password: password, name: name);
    } catch (e){
      rethrow;
    }
  }

  bool isLoggedIn() {
    try {
      return _firebaseAuthService.user != null;
    } catch (e){
      rethrow;
    }
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      await _firebaseAuthService.signInWithEmail(
          email: email,
          password: password);

      return _firebaseAuthService.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuthService.signOut();
  }



  Future<void> resetPassword(String email) async {
    await _firebaseAuthService.resetPassword(email: email);
  }

  Future<void> deleteAccount() async {
    await _firebaseAuthService.deleteAccount();
  }
}
