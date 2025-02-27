import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;
  final _fs = FirebaseFirestore.instance;

  FirebaseAuthService() : _auth = FirebaseAuth.instance {
    _auth.setLanguageCode('kr');
  }

  User? get user => _auth.currentUser;

  // 회원가입 코드
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    String? errorMessage;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = _auth.currentUser;

      if (user != null) {
        await _auth.currentUser?.updateDisplayName(name);
        await _auth.currentUser?.sendEmailVerification();

        UserModel userModel = UserModel(
          uid: user.uid,
          userName: name ?? '사용자',
          email: email,
          profileImageUrl: '',
          createdAt: DateTime.now(),
          reportPostId: const [],
        );

        await _fs.collection('users').doc(user.uid).set(userModel.toMap());

      }
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

  Future<String?> getUid() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        return currentUser.uid;
      } else {
        throw Exception('현재 로그인된 사용자가 없습니다.');
      }
    } catch (e) {
      throw Exception('사용자 UID 가져오기 실패: $e');
    }
  }

  // 로그인 확인
  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  // 로그인
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    String? errorMessage;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );


    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'user-not-found':
          errorMessage = '해당 이메일로 가입된 사용자가 없습니다.';
          break;
        case 'wrong-password':
          errorMessage = '비밀번호가 올바르지 않습니다.';
          break;
        case 'invalid-credential':
          errorMessage = '비밀번호가 올바르지 않거나 유효하지 않은 이메일 입니다.';
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

  // 로그아웃
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('로그아웃 실패: ${e.toString()}');
    }
  }

  // 비밀번호 재설정
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
    } catch (error) {
      errorMessage = '알 수 없는 오류가 발생했습니다.';
    }
    if (errorMessage != null) {
      throw Exception(errorMessage);
    }
  }

  // 유저 이름 변경
  Future<void> updateName(String? name) async {
    try {
      await _auth.currentUser?.updateDisplayName(name);
    } catch (e) {
      throw Exception('수정 실패:$e');
    }
  }

  // 유저 사진 변경
  Future<void> updatePhotoUrl(String? url) async {
    try {
      await _auth.currentUser?.updatePhotoURL(url);
    } catch (e) {
      throw Exception('수정 실패:$e');
    }
  }


  // 유저 사진 삭제
  Future<void> deletePhotoUrl() async {
    try {
      await _auth.currentUser?.updatePhotoURL(null);
    } catch (e) {
      throw Exception('수정 실패:$e');
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      if (!(_auth.currentUser?.emailVerified ?? true)) {
        await _auth.currentUser?.sendEmailVerification();
      } else {
        throw Exception('이미 이메일 인증이 완료되었습니다.');
      }
    } catch (e) {
      throw Exception('인증 메일 전송이 실패 했습니다.');
    }
  }

  // 계정 삭제
  Future<void> deleteAccount() async {
    try{
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        rethrow;
      } else {
        throw Exception('탈퇴과정에 문제가 있습니다. ${e.toString()}');
      }
    }catch(e){
      print(e);
      throw Exception('탈퇴과정에 문제가 있습니다. ${e.toString()}');
    }
  }
}
