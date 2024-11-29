import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/post_model.dart';

class FireStoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // 게시글 생성
  Future<void> createPost(PostModel postModel) async {
    try {
      await _db.collection('posts').add(postModel.toMap());
    } catch (e) {
      throw Exception('게시글 생성에 실패했습니다: $e');
    }
  }

//
//   // 게시글 읽기
//   Future<List<PostModel>> readPosts() async {
//
//   }
//
//   // 게시글 업데이트
//   Future<void> updatePost(String postId, PostModel postModel) async {
//     final postDoc = _fs.collection('posts').doc(postId);
//     await postDoc.update(postModel.toMap());
//   }
//
//   // 게시글 삭제
//   Future<void> deletePost(String postId) async {
//     final postDoc = _fs.collection('posts').doc(postId);
//     await postDoc.delete();
//   }
// }
}