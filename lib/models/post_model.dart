import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String postId; // 포스트 ID
  String title; // 글 제목
  String content; // 글 내용
  List<String> imageUrls; // 이미지 URL 목록 (List<String>으로 수정)
  int likeCount; // 좋아요 개수
  DateTime createdAt; // 작성 시간
  String authorId; // 작성자 ID
  List<String> blockedUserIds; // 차단 목록
  int reportCount; // 신고 횟수

  PostModel({
    required this.postId,
    required this.title,
    required this.content,
    this.likeCount = 0,
    required this.imageUrls,
    required this.createdAt,
    required this.authorId,
    this.blockedUserIds = const [],
    this.reportCount = 0,
  });

  // Firestore => 로컬
  factory PostModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return PostModel(
      postId: data?['postId'],
      title: data?['title'],
      content: data?['content'],
      imageUrls: List<String>.from(data?['imageUrls'] ?? []),
      likeCount: data?['likeCount'] ?? 0,
      createdAt: (data?['createdAt'] as Timestamp).toDate(),
      authorId: data?['authorId'],
      blockedUserIds: List<String>.from(data?['blockedUserIds'] ?? []),
      reportCount: data?['reportCount'] ?? 0,
    );
  }

  // 로컬 -> Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'postId': postId,
      'title': title,
      'content': content,
      'imageUrls': imageUrls,
      'likeCount': likeCount,
      'createdAt': createdAt,
      'authorId': authorId,
      'blockedUserIds': blockedUserIds,
      'reportCount': reportCount,
    };
  }
}
