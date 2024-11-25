class PostModel {
  String postId; // 포스트 ID
  String title; // 글 제목
  String content; // 글 내용
  List<String> imageUrls; // 이미지 URL 목록
  DateTime createdAt; // 작성 시간
  String uid; // 작성자 ID
  int likeCount; // 좋아요 개수
  int reportCount; // 신고 횟수

  PostModel({
    required this.postId,
    required this.title,
    required this.content,
    this.imageUrls = const [],
    required this.createdAt,
    required this.uid,
    this.likeCount = 0,
    this.reportCount = 0,
  });
}

// 컬렉션 posts
// 도큐먼트 자동 생성한 ID
// 도큐먼트필드

List<PostModel> posts = [
  PostModel(
    postId: '',
    title: '',
    content: '',
    imageUrls: [],
    uid: '',
    createdAt: DateTime.now(),
  )
];
