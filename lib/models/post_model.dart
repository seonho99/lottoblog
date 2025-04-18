import 'package:cloud_firestore/cloud_firestore.dart';

final class PostModel {
  String postId; // 포스트 ID
  String title; // 글 제목
  String content; // 글 내용
  List<String> imageUrls; // 이미지 URL 목록
  DateTime createdAt; // 작성 시간
  String? uid; // 작성자 ID
  List<String> likePostUid;
  int likePostCount; // 좋아요 개수
  List<String> reportUserUid;
  int reportUserCount; // 신고 횟수

  PostModel({
    required this.postId,
    required this.title,
    required this.content,
    this.imageUrls = const [],
    this.uid,
    this.likePostUid = const [],
    this.likePostCount = 0,
    this.reportUserUid = const [],
    this.reportUserCount = 0,
    createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'imageUrls': imageUrls,
      'createdAt': createdAt,
      'uid': uid,
      'likePostUid': likePostUid,
      'likePostCount': likePostCount,
      'reportUserUid': reportUserUid,
      'reportUserCount': reportUserCount,
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
      likePostUid: List<String>.from(map['likePostUid'] as List),
      likePostCount: map['likePostCount'] ?? 0,
      reportUserUid: List<String>.from(map['reportUserUid'] as List),
      reportUserCount: map['reportUserCount'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'PostModel(postId: $postId, title: $title, content: $content, imageUrls: $imageUrls, createdAt: $createdAt, uid: $uid, likePostUid: $likePostUid ,likePostCount: $likePostCount,reportUserUid: $reportUserUid, reportUserCount: $reportUserCount,)';
  }
}
