import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  String? uid; // 사용자 ID
  String userName; // 사용자 이름
  String email; // 사용자 이메일
  String profileImageUrl; // 프로필 사진 URL
  DateTime createdAt; // 사용자 가입 날짜

  UsersModel({
    this.uid,
    required this.userName,
    required this.email,
    this.profileImageUrl = '',
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'createdAt': createdAt,
      'uid': uid,
    };
  }

  factory UsersModel.fromMap(Map<String, dynamic> map, String id) {
    return UsersModel(
      uid: id,
      userName: map['userName'] ?? '',
      email: map['email'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}
