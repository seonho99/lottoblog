import 'package:firebase_auth/firebase_auth.dart';

import '../../service/firebase_auth_service.dart';

class AuthRepository {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepository(this._firebaseAuthService);

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      await _firebaseAuthService.signInwithEmail(email: email, password: password);
      return _firebaseAuthService.user;
    } catch (e) {
      throw Exception('로그인 실패: $e');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuthService.signOut();
  }

  bool isLoggedIn() {
    return _firebaseAuthService.isLoggedIn();
  }

  User? get currentUser => _firebaseAuthService.user;

}
