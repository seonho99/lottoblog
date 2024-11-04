import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;
  FirebaseAuthService() : _auth = FirebaseAuth.instance {
    _auth.setLanguageCode('kr');
  }

  User? get user => _auth.currentUser;

  Future<void> singUpWithEmail({
    required String email,
    required String password,
    String? name,
  }) async {
    String? errorMessage;
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser?.updateDisplayName(name);
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'weak-password':
          errorMessage = '영문, 숫자, 특수문자를 포함하여 최소 8자 이상 작성 해야 합니다';
          break;
        case 'email-already-used':
          errorMessage = '이미 사용중인 이메일입니다.';
          break;
        case 'invalid-email':
          errorMessage = '유효하지 않은 이메일 입니다.';
          break;
        default:
          errorMessage = error.message ?? '알 수 없는 에러 발생';
      }
    } catch (error) {
      errorMessage = '알 수 없는 에러 발생';
    }
    if (errorMessage != null) {
      throw Exception(errorMessage);
    }
  }

  Future<void> signInwithEmail({
    required String email,
    required String password,
  }) async {
    String? errorMessage;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'user-not-found':
          errorMessage = '해당 이메일로 가입된 사용자가 없습니다.';
          break;
        case 'wrong-password':
          errorMessage = '비밀번호가 올바르지 않습니다.';
          break;
        case 'invalid-credential':
          errorMessage = '유효하지 않은 이메일 입니다.';
          break;
        case 'invalid-credential':
          errorMessage = '비밀번호가 올바르지 않거나 유효하지 않은 이메일입니다.';
          break;
        default:
          errorMessage = '알 수 없는 오류가 발생했습니다.';
      }
    } catch (error) {
      errorMessage = '알 수 없는 오류가 발생했습니다.';
    }
    if (errorMessage != null) {
      throw Exception(errorMessage);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    String? errorMessage;
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print('비밀번호 재설정 이메일이 전송되었습니다.');
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'auth/user-not-found':
          errorMessage = '해당 이메일로 가입된 사용자가 없습니다.';
          break;
        case 'auth/invalid-email':
          errorMessage = '유효하지 않은 이메일입니다.';
          break;
        default:
          errorMessage = error.message ?? '알 수 없는 오류가 발생했습니다.';
      }
    }catch (error) {
      errorMessage = '알 수 없는 오류가 발생했습니다.';
    }
    if (errorMessage != null) {
      throw Exception(errorMessage);

    }
  }

  Future<void> updateName(String? name) async {
    try {
      await _auth.currentUser?.updateDisplayName(name);
    } catch (e) {
      throw Exception('수정 실패:$e');
    }
  }

  Future<void> updatePhotoUrl(String? url) async {
    try {
      await _auth.currentUser?.updatePhotoURL(url);
    } catch (e){
      throw Exception('수정 실패:$e');
    }
  }

  Future<void> loginWithEmail() async {}

  Future<void> deletePhotoUrl() async {
    try {
      await _auth.currentUser?.updatePhotoURL(null);
    } catch (e) {
      throw Exception('수정 실패:$e');
    }
  }
  Future<void> deleteProfileImage(String? uid) async {
    if(uid == null) throw Exception('잘못된 접근입니다');
    try {
      final profileRef = storageRef.child('user_profiles/${uid}_profile_image.jpg');
      await profileRef.delete();
    } catch (e) {
      throw Exception('upload 실패');
    }
  }

}
