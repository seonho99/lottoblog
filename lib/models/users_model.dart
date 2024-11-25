class UsersModel {
  String uid; // 사용자 ID
  String userName; // 사용자 이름
  String email; // 사용자 이메일
  String profileImageUrl; // 프로필 사진 URL
  DateTime createdAt; // 사용자 가입 날짜

  UsersModel({
    required this.uid,
    required this.userName,
    required this.email,
    this.profileImageUrl='',
    required this.createdAt,
  });
}


List<UsersModel> user = [
  UsersModel(
    uid: '',
    userName: '',
    email: '',
    createdAt: DateTime.now(),

  )
];
