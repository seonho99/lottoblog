import '../../models/post_model.dart';
import '../../service/firestore_service.dart';

class PostRepository {
  final FirestoreService _firestoreService;

  PostRepository(this._firestoreService);

  // 게시글 생성
  Future<void> createPost(PostModel posts) async {
    try {
      await _firestoreService.createPost(posts);
    } catch (e) {
      throw Exception('게시글 생성에 실패했습니다.: $e');
    }
  }



  Future<int> likePostCount({required String postId}) async {
    try {
      return await _firestoreService.likePostCount(postId: postId);
    } catch (e) {
      throw Exception('좋아요 수를 못 읽어왔습니다.: $e');
    }
  }

  Future<int> likePostUid({required String postId, required String uid}) async {
    try {
      return await _firestoreService.likePostUid(postId: postId, uid: uid);
    } catch (e) {
      throw Exception('좋아요를 실패 했습니다.: $e');
    }
  }

  Future<List<PostModel>> likeAllPosts() async {
    try {
      return await _firestoreService.likeAllPosts();
    } catch (e) {
      throw Exception('게시글 목록을 읽어오는데 실패했습니다.: $e');
    }
  }

  Future<List<PostModel>> readAllPosts() async {
    try {
      return await _firestoreService.readAllPost();
    } catch (e) {
      throw Exception('게시글 목록을 읽어오는데 실패했습니다.: $e');
    }
  }

  Future<void> reportPost(String postId) async {
    try {
      await _firestoreService.reportPost(postId);
    } catch (e) {
      throw Exception('게시글 신고를 실패했습니다.: $e');
    }
  }

  Future<List<PostModel>> fetchSafePosts() async {
    try {
      return await _firestoreService.fetchSafePosts();
    } catch (e) {
      throw Exception('게시글 목록을 읽어오는데 실패했습니다. :$e');
    }
  }

  Future<List<PostModel>> fetchUserPosts() async {
    try {
      return await _firestoreService.fetchUserPosts();
    } catch (e) {
      throw Exception('내 게시글을 가져오는데 실패했습니다.: $e');
    }
  }

  Future<PostModel?> fetchPostScreen(String postId) async {
    try {
      return await _firestoreService.fetchPostScreen(postId);
    } catch (e) {
      throw Exception('게시글 목록을 읽어오는데 실패했습니다.: $e');
    }
  }

// 게시글 수정
  Future<void> updatePost(PostModel posts) async {
    try {
      await _firestoreService.updatePost(posts);
    } catch (e) {
      throw Exception('게시글을 가져오는데 실패했습니다.: $e');
    }
  }

// 게시글 삭제
  Future<void> deletePost({required String postId}) async {
    if (postId.isEmpty) {
      throw Exception('삭제할 게시글 ID가 없습니다.');
    }
    try {
      await _firestoreService.deletePost(postId: postId);
    } catch (e) {
      throw Exception('게시글을 삭제하는데 실패했습니다.: $e');
    }
  }
}
