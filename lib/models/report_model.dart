import 'package:cloud_firestore/cloud_firestore.dart';

class ReportModel {
  String reportId; // 부 적절한 ID
  String postId; // 신고한 게시물
  String reporterId; // 신고한 ID
  String reason; // 신고 사유
  DateTime reportedAt; // 신고 시간

  ReportModel(
      {required this.reportId,
      required this.postId,
      required this.reporterId,
      required this.reason,
      required this.reportedAt});

  // Firestore => 로컬
  factory ReportModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ReportModel(
      reportId: data?['reportId'],
      postId: data?['postId'],
      reporterId: data?['reporterId'],
      reason: data?['reason'],
      reportedAt: data?['reportedAt'],
    );
  }

  // 로컬 -> Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'reportId': reportId,
      'postId': postId,
      'reporterId': reporterId,
      'reason': reason,
      'reportedAt': reportedAt,
    };
  }
}
