import 'package:lottoblog/models/user_model.dart';
import 'package:lottoblog/service/firestore_service.dart';

class UserRepo {
  final FirestoreService _firestoreService;

  UserRepo(this._firestoreService);

  Future<UserModel?> fetchProfile({required String uid}) async {
    try {
      UserModel? userModel = await _firestoreService.fetchProfile(uid: uid);
      // print('Fetched userName: ${userModel?.userName}');
      // print('Fetched profileImageUrl: ${userModel?.profileImageUrl}');
      return userModel;
    } catch (e) {
      throw Exception('게시글 생성에 실패했습니다.: $e');
    }
  }

  Future<List<UserModel>> fetchPostScreenUid(String uid) async {
    try {
      return await _firestoreService.fetchPostScreenUid(uid);
    } catch (e) {
      throw Exception('uid 가져오기에 실패했습니다.: $e');
    }
  }
}
