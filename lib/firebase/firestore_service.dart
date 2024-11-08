import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottoblog/models/post_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<DocumentReference> addPost(PostModel post) async {
    CollectionReference posts = _db.collection('posts');
    return await posts.add(post.toMap()); // Firestore에 추가하고 문서 참조 반환
  }
}
