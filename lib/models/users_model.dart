import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  String userId; // 사용자 ID
  String userName; // 사용자 이름
  String email; // 사용자 이메일
  String profileImageUrl; // 프로필 사진 URL
  List<String> postIds; // 작성한 글 ID 목록

  UsersModel(
      {required this.userId,
      required this.userName,
      required this.email,
      required this.profileImageUrl,
      this.postIds = const [],
      });

  // Firestore => 로컬
  factory UsersModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UsersModel(
      userId: data?['userId'],
      userName: data?['userName'],
      email: data?['email'],
      profileImageUrl: data?['profileImageUrl'],
      postIds: data?['postIds'],
    );
  }

  // 로컬 -> Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'userName': userName,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'postIds': postIds,
    };
  }
}
