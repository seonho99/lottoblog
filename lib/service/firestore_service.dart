import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/post_model.dart';
import '../models/user_model.dart';

class FirestoreService {
  final _fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  // 게시글 생성
  Future<void> createPost(PostModel posts) async {
    final postCollection = _fs.collection('posts');
    try {
      final docRef = await postCollection.add(posts.toMap());
      await docRef.update({'postId': docRef.id});
    } catch (e) {
      throw Exception('저장 실패 : $e');
    }
  }


  Future<int> likePostCount({required String postId}) async {
    final postRef = _fs.collection('posts').doc(postId);

    DocumentSnapshot postSnapshot = await postRef.get();

    if (postSnapshot.exists) {
      Map<String, dynamic> postData =
          postSnapshot.data() as Map<String, dynamic>;
      int likePostCount = postData['likePostCount'] ?? 0;
      return likePostCount;
    } else {
      return 0;
    }
  }

  // Future<String> deleteImageUrl({required String postId}) async {
  //   DocumentReference<Map<String, dynamic>> postRef = _fs.collection('post').doc(postId);
  //
  //   DocumentSnapshot postSnapshot = await postRef.get();
  //
  //   final postData = postSnapshot.data() as Map<String, dynamic>;
  //
  //   List<String> updates = List<String, dynamic>{
  //     'imageUrls' : FieldValue.delete(),
  //   };
  // }

  Future<int> likePostUid({required String postId, required String uid}) async {
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

    int likePostCount =
        (updatedData['likePostUid'] as List<dynamic>?)?.length ?? 0;
    await postRef.update({'likePostCount': likePostCount});

    return likePostCount;
  }

  Future<void> reportPost(String postId) async {
    String? currentUserId = _auth.currentUser?.uid;
    if (currentUserId == null) return;

    try {
      DocumentReference postRef = _fs.collection('posts').doc(postId);

      await _fs.runTransaction((transaction) async {
        DocumentSnapshot postSnapshot = await transaction.get(postRef);

        if (!postSnapshot.exists) {
          throw Exception("Post does not exist!");
        }

        List<String> reportUserUid =
            List<String>.from(postSnapshot['reportUserUid'] ?? []);
        int reportUserCount = postSnapshot['reportUserCount'] ?? 0;

        if (!reportUserUid.contains(currentUserId)) {
          reportUserUid.add(currentUserId);
          reportUserCount += 1;

          transaction.update(postRef, {
            'reportUserUid': reportUserUid,
            'reportUserCount': reportUserCount,
          });
        }
      });

      print("Post reported successfully!");
    } catch (e) {
      print("Error reporting post: $e");
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

  Future<List<PostModel>> likeAllPosts() async {
    try {
      QuerySnapshot querySnapshot = await _fs
          .collection('posts')
          .where('likePostCount', isGreaterThanOrEqualTo: 5)
          .get();

      List<PostModel> allPosts = querySnapshot.docs
          .map((doc) => PostModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      return allPosts;
    } catch (e) {
      print("Error fetching posts: $e");
      return [];
    }
  }

  Future<List<PostModel>> fetchSafePosts() async {
    String? currentUserId = _auth.currentUser?.uid;

    try {
      QuerySnapshot querySnapshot = await _fs
          .collection('posts')
          .where('reportUserCount', isLessThanOrEqualTo: 5)
          .get();

      List<PostModel> allPosts = querySnapshot.docs
          .map((doc) => PostModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      if (currentUserId != null) {
        allPosts = allPosts.where((post) {
          return !post.reportUserUid.contains(currentUserId);
        }).toList();
      }

      // if (currentUserId != null) {
      //   allPosts = allPosts.where((post) {
      //     return post.reportUserUid != null && !post.reportUserUid.contains(currentUserId);
      //   }).toList();
      // }

      return allPosts;
    } catch (e) {
      print("Error fetching posts: $e");
      return [];
    }
  }

  Future<PostModel?> fetchPostScreen(String postId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await _fs.collection('posts').doc(postId).get();

      if (!documentSnapshot.exists) {
        throw Exception('해당 게시글을 찾을 수 없습니다.');
      }
      final mapData = documentSnapshot.data()!;
      print('mapData: $mapData');
      return PostModel.fromMap(mapData);
    } catch (e) {
      throw Exception('게시글을 읽어오는데 실패 했습니다.');
    }
  }

  // Future<List<UserModel>> fetchPostScreenUid({required String uid}) async {
  //   QuerySnapshot uidSnapshot =
  //       await _fs.collection('users').where('uid', isEqualTo: uid).get();
  //   try {
  //     return uidSnapshot.docs
  //         .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
  //   } catch (e) {
  //     throw Exception('Error fetching uid: $e');
  //   }
  // }

  Future<UserModel> fetchPostScreenUid({required String uid}) async {
    try {
      DocumentSnapshot uidSnapshot =
          await _fs.collection('users').doc(uid).get();

      if (!uidSnapshot.exists) {
        throw Exception("User not found");
      }

      return UserModel.fromMap(uidSnapshot.data() as Map<String, dynamic>);
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

  Future<void> deletePost({required String postId}) async {
    try {
      DocumentReference<Map<String, dynamic>> postDoc =
          _fs.collection('posts').doc(postId);

      DocumentSnapshot snapshot = await postDoc.get();
      if (!snapshot.exists) {
        throw Exception('게시글이 존재하지 않습니다.');
      }

      await postDoc.delete();
      print('게시글 삭제 성공');
    } catch (e) {
      throw Exception('게시글 삭제에 실패했습니다.:$e');
    }
  }
}
