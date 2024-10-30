import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottoblog/models/report_model.dart';

class ReportService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // 신고 데이터 추가
  Future<void> addReport(ReportModel report) async {
    await _db.collection('reports').doc(report.reportId).set(report.toFirestore());
  }

  // 특정 게시물의 신고 목록 가져오기
  Future<List<ReportModel>> getReportsForPost(String postId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _db
        .collection('reports')
        .where('postId', isEqualTo: postId)
        .get();

    return querySnapshot.docs.map((doc) {
      return ReportModel.fromFirestore(doc, null);
    }).toList();
  }

  // 신고 ID로 특정 신고 가져오기
  Future<ReportModel?> getReportById(String reportId) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
    await _db.collection('reports').doc(reportId).get();
    if (doc.exists) {
      return ReportModel.fromFirestore(doc, null);
    }
    return null; // 문서가 없을 경우 null 반환
  }

  // 신고 삭제
  Future<void> deleteReport(String reportId) async {
    await _db.collection('reports').doc(reportId).delete();
  }
}
