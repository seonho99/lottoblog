class PostModel {
  String postId; // 포스트 ID
  String title; // 글 제목
  String content; // 글 내용
  List<String> imageUrls; // 이미지 URL 목록
  DateTime createdAt; // 작성 시간
  String userId; // 작성자 ID
  int likeCount; // 좋아요 개수
  DateTime updatedAt; // 수정 시간
  int reportCount; // 신고 횟수

  PostModel({
    required this.postId,
    required this.title,
    required this.content,
    this.imageUrls = const [],
    required this.createdAt,
    required this.userId,
    this.likeCount = 0,
    required this.updatedAt,
    this.reportCount = 0,
  });
}
