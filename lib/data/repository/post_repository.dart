import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottoblog/service/firebase_auth_service.dart';
import '../../models/post_model.dart';
import '../../service/firestore_service.dart';

class PostRepository {
  final _firestoreService = FirestoreService();
  FirebaseAuthService auth = FirebaseAuthService();


  // Future<String> getUserId() async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   if (user == null) {
  //     throw Exception('사용자가 로그인되지 않았습니다.');
  //   }
  //   return user.uid; // 사용자 UID 반환
  // }

  // 게시글 생성
  Future<void> addPost(PostModel postmodel) async {
    postmodel.uid = auth.user?.uid;
    try {
      await _firestoreService.createPost(postmodel);

    } catch (e) {
      rethrow;
    }
  }

  // 게시글 수정
  Future<void> updatePost(PostModel postModel) async {
    try {
      final postDoc = FirebaseFirestore.instance.collection('posts').doc(postModel.postId); // Firestore의 게시글 문서
      await postDoc.update(postModel.toMap());
    } catch (e) {
      throw Exception('게시글 수정에 실패했습니다: $e');
    }
  }

  // 게시글 삭제
  Future<void> deletePost(String postId) async {
    try {
      final postDoc = FirebaseFirestore.instance.collection('posts').doc(postId); // Firestore에서 해당 게시글 문서
      await postDoc.delete();
    } catch (e) {
      throw Exception('게시글 삭제에 실패했습니다: $e');
    }
  }

  Future<List<PostModel>> getPostsUser(String uid) async {
    try {
      return await _firestoreService.getPostsUser(uid);
    } catch (e) {
      throw Exception('사용자 게시글을 불러오는데 실패했습니다: $e');
    }
  }
}
