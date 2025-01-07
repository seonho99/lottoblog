import 'package:cloud_firestore/cloud_firestore.dart';

final class PostModel {
  String? postId; // 포스트 ID
  String title; // 글 제목
  String content; // 글 내용
  List<String> imageUrls; // 이미지 URL 목록
  DateTime createdAt; // 작성 시간
  String? uid; // 작성자 ID
  int likeCount; // 좋아요 개수
  int reportCount; // 신고 횟수

  PostModel({
    this.postId,
    required this.title,
    required this.content,
    this.imageUrls = const [],
    this.uid,
    this.likeCount = 0,
    this.reportCount = 0,
    createdAt,
  }):createdAt=createdAt??DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'imageUrls': imageUrls,
      'createdAt': createdAt,
      'uid': uid,
      'likeCount': likeCount,
      'reportCount': reportCount,
      'postId': postId,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postId: map['postId'],
      title: map['title'],
      content: map['content'],
      imageUrls: List<String>.from(map['imageUrls'] as List),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      uid: map['uid'],
      likeCount: map['likeCount'] ?? 0,
      reportCount: map['reportCount'] ?? 0,
    );
  }
}
