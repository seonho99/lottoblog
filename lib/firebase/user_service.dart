import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottoblog/models/users_model.dart';

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // 사용자 데이터 추가
  Future<void> addUser(UsersModel user) async {
    await _db.collection('users').doc(user.userId).set(user.toFirestore());
  }

  // 사용자 ID로 특정 사용자 가져오기
  Future<UsersModel?> getUserById(String userId) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
    await _db.collection('users').doc(userId).get();
    if (doc.exists) {
      return UsersModel.fromFirestore(doc, null);
    }
    return null; // 문서가 없을 경우 null 반환
  }

  // 모든 사용자 목록 가져오기
  Future<List<UsersModel>> getAllUsers() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _db.collection('users').get();

    return querySnapshot.docs.map((doc) {
      return UsersModel.fromFirestore(doc, null);
    }).toList();
  }

  // 사용자 정보 업데이트 (예: 프로필 이미지 업데이트)
  Future<void> updateUserProfileImage(String userId, String newProfileImageUrl) async {
    await _db.collection('users').doc(userId).update({
      'profileImageUrl': newProfileImageUrl,
    });
  }

  // 사용자 삭제
  Future<void> deleteUser(String userId) async {
    await _db.collection('users').doc(userId).delete();
  }
}
