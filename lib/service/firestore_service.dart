import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottoblog/models/post_model.dart';

class FirestoreService {
  FirebaseFirestore _fs = FirebaseFirestore.instance;


  Future<String?> getPostId(String postId) async {
    try {
      DocumentReference docRef = _fs.collection('posts').doc(postId);

      DocumentSnapshot docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        return docSnapshot['postId'];
      } else {
        print('문서가 존재하지 않습니다.');
        return null;
      }
    } catch (e) {
      print('오류 발생: $e');
      return null;
    }
  }


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

  Future<PostModel> readPost(String postId) async {
    final postCollection = _fs.collection('posts');

    try {
      final documentSnapshot = await postCollection.doc(postId).get();

      if (!documentSnapshot.exists) {
        throw Exception('해당 게시글을 찾을 수 없습니다.');
      }

      final mapData = documentSnapshot.data()!;
      return PostModel.fromMap(mapData);
    } catch (e) {
      print('Error reading post: $e');
      throw Exception('게시글을 읽어오는 데 실패했습니다.');
    }
  }


  // 전체
  Future<List<PostModel>> fetchAllPosts({required String uid}) async {
    final _postCollection = _fs.collection('posts');
    List<PostModel> returnData = [];

    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await _postCollection
          .where('uid',isEqualTo: uid)
          .get();

      final queryDocumentSnapshot = querySnapshot.docs;

      for (final QueryDocumentSnapshot<Map<String, dynamic>> doc
      in queryDocumentSnapshot) {
        returnData.add(PostModel.fromMap(doc.data()));
      }
    } catch (e) {
      print('Firestore fetch error: $e');
      throw Exception('게시글을 가져오는데 실패 했습니다.');
    }
    return returnData;
  }


  Future<void> updatePost(PostModel posts) async {
    final _postCollection = _fs.collection('posts');

    if (posts.postId == null || posts.postId!.isEmpty) {
      throw Exception('postId가 없습니다');
    }
    try {
      await _postCollection.doc(posts.postId).update(posts.toMap());
    } catch (e) {
      throw Exception('update 실패: $e');
    }
  }

  Future<void> deletePost(String postId) async {
    final _postCollection = _fs.collection('posts');

    try {
      final documentReference = _postCollection.doc(postId);
      await documentReference.delete();
    } catch (e) {
      throw Exception('게시글 삭제에 실패했습니다.:$e');
    }
  }
}
