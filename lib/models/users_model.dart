class UsersModel {
  String userId; // 사용자 ID
  String userName; // 사용자 이름
  String email; // 사용자 이메일
  String profileImageUrl; // 프로필 사진 URL
  List<String> postIds; // 작성한 글 ID 목록
  DateTime createdAt; // 사용자 가입 날짜

  UsersModel({
    required this.userId,
    required this.userName,
    required this.email,
    this.profileImageUrl='',
    this.postIds = const [],
    required this.createdAt,
  });
}


