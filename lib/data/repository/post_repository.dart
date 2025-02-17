import '../../models/post_model.dart';
import '../../service/firestore_service.dart';

class PostRepository {
  final FirestoreService _firestoreService;

  PostRepository(this._firestoreService);

  String? getCurrentUserUid() {
    return _firestoreService.getCurrentUserUid();
  }

  // 게시글 생성
  Future<void> createPost(PostModel posts) async {
    try {
      await _firestoreService.createPost(posts);
    } catch (e) {
      throw Exception('게시글 생성에 실패했습니다.: $e');
    }
  }

  Future<PostModel> readPost(String postId) async {
    try {
      return await _firestoreService.readPost(postId);
    } catch (e) {
      throw Exception('게시글을 읽어오는데 실패했습니다.: $e');
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

  // Future<PostModel?> likeState(String postId) async{
  //   try {
  //     return await _firestoreService.likeState(postId);
  //   } catch (e) {
  //     throw Exception('좋아요 기능을 실패했습니다.: $e');
  //   }
  // }

  // Future<List<String>> getAllPostIds(List<PostModel> posts) async {
  //   try {
  //     return await _firestoreService.getAllPostIds(posts);
  //   } catch (e) {
  //     throw Exception('포스트 아이디들을 읽어오는데 실패했습니다.: $e');
  //   }
  // }

  // Future<List<PostModel>> readAllPosts({required String postId, int limit = 10, PostModel? lastPosts}) async {
  //   try {
  //     return await _firestoreService.readAllPost(postId: postId,limit: limit,lastPosts: lastPosts);
  //   } catch (e) {
  //     throw Exception('게시글 목록을 읽어오는데 실패했습니다.: $e');
  //   }
  // }

  Future<List<PostModel>> readAllPosts() async {
    try {
      return await _firestoreService.readAllPost();
    } catch (e) {
      throw Exception('게시글 목록을 읽어오는데 실패했습니다.: $e');
    }
  }

  Future<List<PostModel>> fetchUserPosts() async {
    try {
      return await _firestoreService.fetchUserPosts();
    } catch (e) {
      throw Exception('내 게시글을 가져오는데 실패했습니다.: $e');
    }
  }

  Future<List<PostModel>> fetchPostId(String postId) async {
    try {
      return await _firestoreService.fetchPostId(postId);
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
  Future<void> deletePost(String postId) async {
    if (postId.isEmpty) {
      throw Exception('삭제할 게시글 ID가 없습니다.');
    }
    try {
      await _firestoreService.deletePost(postId);
    } catch (e) {
      throw Exception('게시글을 삭제하는데 실패했습니다.: $e');
    }
  }
}
