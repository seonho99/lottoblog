import 'package:firebase_auth/firebase_auth.dart';
import '../../service/firebase_auth_service.dart';

class AuthRepository {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepository(this._firebaseAuthService);

  bool isLoggedIn() {
    return _firebaseAuthService.user != null;
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      await _firebaseAuthService.signInWithEmail(
          email: email, password: password);
      return _firebaseAuthService.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuthService.signOut();
  }

  Future<void> signUpWithEmail(
      String email, String password, String? name) async {
    await _firebaseAuthService.signUpWithEmail(
        email: email, password: password, name: name);
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuthService.resetPassword(email: email);
  }

  Future<void> deleteAccount() async {
    await _firebaseAuthService.deleteAccount();
  }
}
