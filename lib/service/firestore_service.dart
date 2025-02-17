import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/post_model.dart';
import '../models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _fs = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;

  String? getCurrentUserUid() {
    return user?.uid;
  }

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

  // Future<List<PostModel>> getPostList() async {
  //   final postCollection = _fs.collection('posts');
  //   QuerySnapshot snapshot = await postCollection.get();
  //   return snapshot.docs
  //       .map((doc) => PostModel.fromMap(doc.data() as Map<String, dynamic>))
  //       .toList();
  // }

  Future<int> likeCount({required String postId}) async {
    final postRef = _fs.collection('posts').doc(postId);

    DocumentSnapshot postSnapshot = await postRef.get();

    if (postSnapshot.exists) {
      Map<String, dynamic> postData =
          postSnapshot.data() as Map<String, dynamic>;
      int likeCount = postData['likeCount'] ?? 0;
      return likeCount;
    } else {
      return 0;
    }
  }

  Future<int> likePost({required String postId, required String uid}) async {
    final postRef = _fs.collection('posts').doc(postId);
    // final userCollection = _fs.collection('users');

    DocumentSnapshot postSnapshot = await postRef.get();
    // QuerySnapshot userSnapshot = await userCollection.get();

    final postData = postSnapshot.data() as Map<String, dynamic>;

    List<String> likes = List<String>.from(postData['likePostUid'] ?? []);

    if (likes.contains(uid)) {
      print('update remove');
      await postRef.update({
        'likePostUid': FieldValue.arrayRemove([uid])
      });
    } else {
      print('update add');
      await postRef.update({
        'likePostUid': FieldValue.arrayUnion([uid])
      });
    }
    DocumentSnapshot<Map<String, dynamic>> updatedDoc = await postRef.get();
    final updatedData = updatedDoc.data() as Map<String, dynamic>;

    int likeCount = (updatedData['likePostUid'] as List<dynamic>?)?.length ?? 0;
    await postRef.update({'likeCount': likeCount});

    return likeCount;
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

  Future<List<PostModel>> fetchPostId(String postId) async {
    QuerySnapshot querySnapshot = await _fs.collection('posts').where('postId', isEqualTo: postId).get();

    try {
      return querySnapshot.docs.map((doc) => PostModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception("Error fetching posts: $e");
    }
  }

  Future<List<UserModel>> fetchPostScreenUid(String uid) async {
    QuerySnapshot uidSnapshot = await _fs.collection('users').where('uid', isEqualTo: uid).get();
    try {
      return uidSnapshot.docs.map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Error fetching uid: $e');
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

  Future<UserModel?> fetchProfile({required String uid}) async {
    try {
      DocumentSnapshot userDoc = await _fs.collection('users').doc(uid).get();
      if (userDoc.exists) {
        // String userName = userDoc['userName'];
        // String profileImageUrl = userDoc['profileImageUrl'];

        return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
          // UserModel(
          // userName: userName,
          // profileImageUrl: profileImageUrl,
          // email: '',
        // );
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('fetch error');
    }
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
