import 'package:lottoblog/service/firestore_service.dart';

import '../../models/post_model.dart';


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

  Future<PostModel> readPost(String postId) async {
    try {
      return await _firestoreService.readPost(postId);
    } catch (e) {
      throw Exception('게시글을 읽어오는데 실패했습니다.: $e');
    }
  }

  Future<List<PostModel>> readAllPosts() async {
    try {
      return await _firestoreService.readAllPost();
    } catch (e) {
      throw Exception('게시글 목록을 읽어오는데 실패했습니다.: $e');
    }
  }

  Future<List<PostModel>> fetchAllPosts({required String uid}) async {
    try {
      return await _firestoreService.fetchMyPosts(uid: uid);
    }catch(e){
      throw Exception('게시글을 가져오는데 실패했습니다.: $e');
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
    if (postId.isEmpty){
      throw Exception('삭제할 게시글 ID가 없습니다.');
    }
    try {
      await _firestoreService.deletePost(postId);
    } catch (e) {
      throw Exception('게시글을 삭제하는데 실패했습니다.: $e');
    }
  }
}