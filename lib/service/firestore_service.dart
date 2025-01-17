import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/post_model.dart';

class FirestoreService {
  FirebaseFirestore _fs = FirebaseFirestore.instance;

  // Future<void> getUserModeltoFS(UserModel userModel) async {
  //   try {
  //     final userCollection = _fs.collection('users');
  //     await userCollection.doc(userModel.uid).set(userModel.toMap());
  //   } catch (e) {
  //     throw Exception('저장 실패 : $e');
  //   }
  // }

  // 게시글 생성
  Future<void> createPost(PostModel postModel) async {
    final postCollection = _fs.collection('posts');
    try {
      final docRef = await postCollection.add(postModel.toMap());
      await docRef.update({'postId': docRef.id});
    } catch (e) {
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
      throw Exception('게시글을 읽어오는데 실패 했습니다.');
    }
  }

  // Future<List<String>> getAllPostIds(List<PostModel> posts) async {
  //   final postCollection = FirebaseFirestore.instance.collection('posts');
  //   List<String> postIds = [];
  //
  //   try {
  //     for (var post in posts) {
  //       final querySnapshot = await postCollection
  //           .where('postId', isEqualTo: post.postId)
  //           .get();
  //
  //       for (var doc in querySnapshot.docs) {
  //         postIds.add(doc.data()['postId']);
  //       }
  //     }
  //   } catch (e) {
  //     throw Exception('fetch error: $e');
  //   }
  //
  //   return postIds;
  // }


  // Future<List<PostModel>> readAllPost({required String postId, int limit = 10, PostModel? lastPosts}) async {
  //   final _postCollection = _fs.collection('posts');
  //   List<PostModel> returnData = [];
  //
  //   try {
  //     Query<Map<String, dynamic>> query = _postCollection
  //         .where('postId', isEqualTo: postId)
  //         .orderBy('createdAt')
  //         .limit(limit);
  //     if(lastPosts != null){
  //       query = query.startAfter([lastPosts.createdAt.millisecondsSinceEpoch, lastPosts.postId]);
  //     }
  //     final QuerySnapshot<Map<String,dynamic>> querySnapshot = await query.get();
  //     for(final QueryDocumentSnapshot<Map<String,dynamic>> doc in querySnapshot.docs){
  //       returnData.add(PostModel.fromMap(doc.data()));
  //     }
  //   } catch (e) {
  //     throw Exception('fetch error');
  //   }
  //   return returnData;
  // }

  Future<List<PostModel>> readAllPost() async {
    final _postCollection = _fs.collection('posts');
    try {
      QuerySnapshot querySnapshot = await _postCollection.get();
      final allData = querySnapshot.docs
          .map((doc) => PostModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      print('fetching posts: $allData');
      return allData;
    } catch (e) {
      print('Error fetching posts: $e');
      return [];
    }
  }

  // 자신의 포스트
  Future<List<PostModel>> fetchMyPosts({required String uid}) async {
    final _postCollection = _fs.collection('posts');
    List<PostModel> returnData = [];

    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _postCollection.where('uid', isEqualTo: uid).get();

      final queryDocumentSnapshot = querySnapshot.docs;

      for (final QueryDocumentSnapshot<Map<String, dynamic>> doc
          in queryDocumentSnapshot) {
        returnData.add(PostModel.fromMap(doc.data()));
      }
      print('fetching my posts: $returnData');
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
