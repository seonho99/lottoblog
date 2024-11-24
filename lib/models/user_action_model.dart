class UserActionModel {
  String userId; // 사용자 ID
  String targetUserId; // 신고된 사용자 또는 게시물
  int isBlocked; // 차단 여부
  int isReported; // 신고 여부
  String reason; // 신고 사유 (필수)
  DateTime actionTime; // 차단 또는 신고 시간

  UserActionModel({
    required this.userId,
    required this.targetUserId,
    this.isBlocked = 0,
    this.isReported = 0,
    required this.reason,
    DateTime? actionTime,
  }) : actionTime = actionTime ?? DateTime.now(); // 기본값 설정
}
