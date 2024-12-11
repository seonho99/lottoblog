import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/post_model.dart';

class FirestoreService {
  FirebaseFirestore _fs = FirebaseFirestore.instance;


  // 게시글 생성
  Future<void> createPost(PostModel postmodel) async {
    final postCollection = _fs.collection('posts');
    try {
      final docRef = await postCollection.add(postmodel.toMap());
      await docRef.update({'postId': docRef.id});
    } on FirebaseException catch (e) {
      print('FBException : $e');
      throw Exception('저장에 실패했습니다. $e');
    } catch (e) {
      print('알 수 없는 에러 : $e');
      throw Exception('저장 실패 : $e');
    }
  }

  // 전체
  Future<List<PostModel>> fetchAllPosts() async {
    final _postCollection = _fs.collection('posts');
    List<PostModel> returnData = [];

    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await _postCollection
          .where('postId')
          .get();

      final queryDocumentSnapshot = querySnapshot.docs;
      for (final QueryDocumentSnapshot<Map<String, dynamic>> doc
      in queryDocumentSnapshot) {
        returnData.add(PostModel.fromMap(doc.data()));
      }
    } catch (e) {
      print('Firestore fetch error: $e');
      throw Exception('게시글 가져오는데 실패 했습니다.');
    }
    return returnData;
  }

  Future<PostModel> readPost(String postId) async {
    final postCollection = _fs.collection('posts');

    try {
      final documentSnapshot = await postCollection
          .where('postId')
          .get();
      if (documentSnapshot.docs.isEmpty) {
        throw Exception('해당 게시글을 찾을 수 없습니다.');
      }
      final mapData = documentSnapshot.docs.first.data();
      return PostModel.fromMap(mapData);
    } catch (e) {
      print('Error reading post: $e');
      throw Exception('게시글을 읽어오는 데 실패했습니다.');
    }
  }



  Future<void> updatePost(PostModel postmodel) async {
    final _postCollection = _fs.collection('posts');
    if (postmodel.postId == null || postmodel.postId!.isEmpty) {
      throw Exception('postId가 없습니다');
    }
    try {
      await _postCollection.doc(postmodel.postId).update(postmodel.toMap());
    } catch (e) {
      throw Exception('update 실패: $e');
    }
  }

  Future<void> deletePost(String postId) async {
    final _postCollection = _fs.collection('posts');

    if (postId.isEmpty){
      throw Exception('삭제할 게시글 ID가 없습니다.');
    }
    try {
      final documentReference = _postCollection.doc(postId);
      await documentReference.delete();
    } catch (e) {
      print('게시글 삭제 실패: $e');
      throw Exception('게시글 삭제에 실패했습니다.');
    }
  }
}
