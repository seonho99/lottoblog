import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottoblog/models/post_model.dart';

class PostService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // 게시물 추가
  Future<void> addPost(PostModel post) async {
    await _db.collection('posts').doc(post.postId).set(post.toFirestore());
  }

  // 게시물 ID로 특정 게시물 가져오기
  Future<PostModel?> getPostById(String postId) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
    await _db.collection('posts').doc(postId).get();
    if (doc.exists) {
      return PostModel.fromFirestore(doc, null);
    }
    return null; // 문서가 없을 경우 null 반환
  }

  // 좋아요 베스트 순으로 게시물 목록 가져오기
  Future<List<PostModel>> getTopLikedPosts(int limit) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _db
        .collection('posts')
        .orderBy('likeCount', descending: true)
        .limit(limit)
        .get();

    return querySnapshot.docs.map((doc) {
      return PostModel.fromFirestore(doc, null);
    }).toList();
  }

  // 좋아요 수 업데이트
  Future<void> updateLikeCount(String postId, int newLikeCount) async {
    await _db.collection('posts').doc(postId).update({
      'likeCount': newLikeCount,
    });
  }

  // 게시물 삭제
  Future<void> deletePost(String postId) async {
    await _db.collection('posts').doc(postId).delete();
  }
}
