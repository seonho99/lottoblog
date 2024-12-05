import '../../models/post_model.dart';
import '../../service/firebase_auth_service.dart';
import '../../service/firestore_service.dart';

class PostRepository {
  FirestoreService _firestoreService = FirestoreService();
  FirebaseAuthService auth = FirebaseAuthService();

  final List<PostModel> _postmodel = [];

  // 게시글 생성
  Future<void> addPost(PostModel postmodel) async {
    postmodel.uid = auth.user?.uid;

    try {
      await _firestoreService.createPost(postmodel);
      _postmodel.add(postmodel);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchAllPosts() async {
    try {
      final List<PostModel> fetchPosts = await _firestoreService
          .fetchAllPosts(postId: auth.user!.uid);
      _postmodel.addAll(fetchPosts);
    } catch (e) {
     rethrow;
    }
  }


// 게시글 수정
  Future<void> updatePost(PostModel postModel) async {
    if (postModel.postId == null || postModel.postId!.isEmpty) {
      throw Exception('postId가 없습니다.');
    }
    try {
      await _firestoreService.updatePost(postModel);
    } catch (e) {
      rethrow;
    }
  }


// 게시글 삭제
  Future<void> deletePost(String postId) async {
    if (postId.isEmpty) {
      throw Exception('삭제할 게시글 ID가 없습니다.');
    }
    try {
      await _firestoreService.deletePost(postId);
    } catch (e){
      rethrow;
    }

  }
}