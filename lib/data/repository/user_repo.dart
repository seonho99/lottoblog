import 'package:lottoblog/models/user_model.dart';
import 'package:lottoblog/service/firestore_service.dart';

class UserRepo {
  final FirestoreService _firestoreService;

  UserRepo(this._firestoreService);
  
  Future<UserModel?> fetchProfile({required String uid}) async {
    try {
      await _firestoreService.fetchProfile(uid: uid);
    } catch (e) {
      throw Exception('게시글 생성에 실패했습니다.: $e');
    }
  } 

}


