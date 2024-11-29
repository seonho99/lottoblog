import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottoblog/service/firestore_service.dart';
import '../../models/post_model.dart';

class PostRepository {
  final FireStoreService _fireStoreService;

  PostRepository(this._fireStoreService);

  Future<String> getUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('사용자가 로그인되지 않았습니다.');
    }
    return user.uid;
  }

  // 게시글 생성
  Future<void> createPost(PostModel postModel) async {
    try {
      await _fireStoreService.createPost(postModel);
    } catch (e) {
      throw Exception('게시글 생성에 실패했습니다: $e');
    }
  }

  Future<void> readPost() async {
    return null;
  }

  Future<void> updatePost() async {
    // 구현 필요
  }

  Future<void> deletePost() async {
    // 구현 필요
  }
}
