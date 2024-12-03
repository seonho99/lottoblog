import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottoblog/models/user_model.dart';
import '../models/post_model.dart';

class FireStoreService {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;

  Future<UserModel?> getUserData(String uid) async {
    try {
      DocumentSnapshot snapshot = await _fs.collection('user').doc(uid).get();

      if (snapshot.exists) {
        return UserModel.fromMap(snapshot.data() as Map<String, dynamic>, snapshot.id);
      }
      return null;
    } catch (e) {
      throw Exception('사용자 데이터를 가져오는데 실패했습니다. $e');
    }
  }

  // 게시글 생성
  Future<void> createPost(PostModel postModel) async {
    try {
      final postDocRef = await _fs.collection('posts').add(postModel.toMap());

      await postDocRef.update({'postId':postDocRef.id});
    } catch (e) {
      throw Exception('게시글 생성에 실패했습니다: $e');
    }
  }


  Future<PostModel> readPost(String postId) async {
    try {
      final postsCollection = _fs.collection('posts');
      final documentSnapshot = await postsCollection.doc(postId).get(); // 문서 읽기
      if (!documentSnapshot.exists) throw Exception('Post with ID $postId not found');
      final mapData = documentSnapshot.data(); // 문서 데이터
      return PostModel.fromMap(mapData!, documentSnapshot.id); // 반환
    } catch (e) {
      throw Exception('게시글 읽기에 실패했습니다: $e');
    }
  }

  // 전체
  Future<List<PostModel>> fetchAllPosts() async {
    try {
      final querySnapshot = await _fs.collection('posts').get();
      return querySnapshot.docs.map((doc) {
        return PostModel.fromMap(doc.data(), doc.id);
      }).toList();
    } catch (e) {
      throw Exception('게시글 목록을 불러오는데 실패했습니다: $e');
    }
  }

  // 글 목록
  Future<List<PostModel>> getPostsUser(String uid) async {
    try {
      final postsCollection = _fs.collection('posts');
      final querySnapshot = await postsCollection
          .where('uid', isEqualTo: uid)
          .get();
      return querySnapshot.docs.map((doc) {
        return PostModel.fromMap(doc.data(), doc.id);
      }).toList();
    } catch (e) {
      throw Exception('사용자 게시글을 불러오는데 실패했습니다: $e');
    }
  }
}
