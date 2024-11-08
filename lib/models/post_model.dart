class PostModel {
  String postId; // 포스트 ID
  String title; // 글 제목
  String content; // 글 내용
  List<String> imageUrls; // 이미지 URL 목록 (List<String>으로 수정)
  int likeCount; // 좋아요 개수
  DateTime createdAt; // 작성 시간
  String authorId; // 작성자 ID
  int reportCount; // 신고 횟수

  PostModel({
    required this.postId,
    required this.title,
    required this.content,
    this.imageUrls = const [],
    this.likeCount = 0,
    required this.createdAt,
    required this.authorId,
    this.reportCount = 0,
  });

  // 로컬 -> Firestore
  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'title': title,
      'content': content,
      'imageUrls': imageUrls,
      'likeCount': likeCount,
      'createdAt': createdAt,
      'authorId': authorId,
      'reportCount': reportCount,
    };
  }
}
