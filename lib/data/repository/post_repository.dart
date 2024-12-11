import 'package:firebase_auth/firebase_auth.dart';

import '../../models/post_model.dart';
import '../../service/firebase_auth_service.dart';
import '../../service/firestore_service.dart';

// 컬렉션의 posts에 모든 파일을 가져오겠다
// 로그인하고 posts를 작성
// 컬렉션에 posts에 uid가 같은것만 가져오겠다

final String currentUserUid = FirebaseAuth.instance.currentUser?.uid ?? '';

class PostRepository {
  final FirestoreService _firestoreService;
  FirebaseAuthService auth = FirebaseAuthService();

  PostRepository(this._firestoreService);

  final List<PostModel> _postModels = [];


  List<PostModel> get postModel => _postModels;

  // 게시글 생성
  Future<void> addPost(PostModel postModel) async {
    postModel.uid = auth.user?.uid;

    try {
      await _firestoreService.createPost(postModel);
      _postModels.add(postModel);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchAllPosts() async {
    if(auth.user == null) return;
    try {
      final List<PostModel> fetchPosts = await _firestoreService
          .fetchAllPosts();
      _postModels.addAll(fetchPosts);
    } catch (e) {
     rethrow;
    }
  }

  Future<void> readPost(String postId) async {
    if(auth.user == null) return;
    try {
      final PostModel readPost = await _firestoreService.readPost(postId);
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