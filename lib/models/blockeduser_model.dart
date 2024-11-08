class BlockeduserModel {
  String userId; // 차단한 사용자 ID
  String blockedUserId; // 차단된 사용자 ID
  DateTime blockedAt; // 차단 시간

  BlockeduserModel({
    required this.userId,
    required this.blockedUserId,
    required this.blockedAt,
  });
}