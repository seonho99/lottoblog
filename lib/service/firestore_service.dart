import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/post_model.dart';

class FirestoreService {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;

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

  Future<List<PostModel>> getPostList() async {
    final postCollection = _fs.collection('posts');
    QuerySnapshot snapshot = await postCollection.get();
    return snapshot.docs
        .map((doc) => PostModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<int> likePost({required String postId, required String uid}) async {
    final postCollection = _fs.collection('posts');
    final userCollection = _fs.collection('users');

    QuerySnapshot postSnapshot = await postCollection.get();
    QuerySnapshot userSnapshot = await userCollection.get();

    List<String> likePostUid = List<String>.from(postSnapshot.data()?['likePostUid'] ?? []);
    List<String> userLikePost = List<String>.from(userSnapshot.data()?['userLikePost'] ?? []);

  }

  // Future<PostModel> likePost({
  //   required String postId,
  //   required String uid,
  // }) async {
  //   final postCollection = _fs.collection('posts');
  //   DocumentReference postRef = await postCollection.doc('postId');
  //   final userCollection = _fs.collection('users');
  //   DocumentReference userRef = await userCollection.doc('uid');
  //
  //
  //   await FirebaseFirestore.instance.runTransaction((transaction) async {
  //     DocumentSnapshot postSnapshot = await transaction.get(postRef);
  //     DocumentSnapshot userSnapshot = await transaction.get(userRef);
  //
  //     if (!postSnapshot.exists) throw Exception('게시글이 존재하지 않습니다.');
  //     if (!userSnapshot.exists) throw Exception('사용자가 존재하지 않습니다.');
  //
  //     final postData = postSnapshot.data() as Map<String, dynamic>;
  //     final userData = userSnapshot.data() as Map<String, dynamic>;
  //
  //     List<String> likePostUid = List<String>.from(postData['likePostUid'] ?? []);
  //     List<String> userLikePost = List<String>.from(userData['userLikePost'] ?? []);
  //
  //     bool isLiked = likePostUid.contains(uid);
  //
  //     transaction.update(postRef, {
  //       'likePostUid': isLiked ? FieldValue.arrayRemove([uid]) : FieldValue.arrayUnion([uid]),
  //       'likeCount': isLiked ? FieldValue.increment(-1) : FieldValue.increment(1),
  //     });
  //
  //     transaction.update(userRef, {
  //       'userLikePost': isLiked ? FieldValue.arrayRemove([postId]) : FieldValue.arrayUnion([postId]),
  //     });
  //   });
  //
  //   DocumentSnapshot updatedSnapshot = await postRef.get();
  //   return PostModel.fromMap(updatedSnapshot.data() as Map<String, dynamic>);
  // }

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

  Future<List<PostModel>> readAllPost() async {
    final _postCollection = _fs.collection('posts');
    try {
      QuerySnapshot querySnapshot = await _postCollection.get();
      final allData = querySnapshot.docs
          .map((doc) => PostModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      // print('fetching posts: $allData');
      return allData;
    } catch (e) {
      // print('Error fetching posts: $e');
      throw Exception('게시글 목록을 가져오는데 실패 했습니다.');
    }
  }

  // 자신의 포스트
  Future<List<PostModel>> fetchUserPosts() async {
    final postCollection = _fs.collection('posts');
    List<PostModel> myPosts = [];

    try {
      final User? user = _auth.currentUser;
      if (user == null) {
        throw Exception('로그인이 되어 있지 않습니다.');
      }
      final String uid = user.uid;

      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await postCollection.where('uid', isEqualTo: uid).get();
      final queryDocumentSnapshot = querySnapshot.docs;
      for (QueryDocumentSnapshot<Map<String, dynamic>> docs
          in queryDocumentSnapshot) {
        myPosts.add(PostModel.fromMap(docs.data()));
      }
    } catch (e) {
      throw Exception('fetch error');
    }
    return myPosts;
  }

  // Future<List<PostModel>> fetchMyPosts() async {
  //   final _postCollection = _fs.collection('posts');
  //   List<PostModel> returnData = [];
  //
  //   try {
  //     final QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //         await _postCollection.where('uid', isEqualTo: uid).get();
  //
  //     final queryDocumentSnapshot = querySnapshot.docs;
  //
  //     for (final QueryDocumentSnapshot<Map<String, dynamic>> doc
  //         in queryDocumentSnapshot) {
  //       print('returnData: $returnData');
  //       returnData.add(PostModel.fromMap(doc.data()));
  //     }
  //     // print('fetching my posts: $returnData');
  //   } catch (e) {
  //     // print('Firestore fetch error: $e');
  //     throw Exception('게시글을 가져오는데 실패 했습니다.');
  //   }
  //   print('returnData: $returnData');
  //   return returnData;
  // }

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
