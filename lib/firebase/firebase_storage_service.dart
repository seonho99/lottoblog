import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import '../models/post_model.dart';

class FirebaseStorageService {
  final storageRef = FirebaseStorage.instance.ref();

  Future<String> uploadProfileImage(File imageFile, String? uid) async {
    if(uid == null) throw Exception('잘못된 접근입니다');
    try {
      final profileRef = storageRef.child('user_profiles/${uid}_profile_image.jpg');
      if (kIsWeb) {
        await profileRef.putData(await imageFile.readAsBytes());
      } else {
        await profileRef.putFile(imageFile);
      }
      final downloadUrl = await profileRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('upload 실패');
    }
  }

  Future<void> deleteProfileImage(String? uid) async {
    if(uid == null) throw Exception('잘못된 접근입니다');
    try {
      final profileRef = storageRef.child('user_profiles/${uid}_profile_image.jpg');
      await profileRef.delete();
    } catch (e) {
      throw Exception('upload 실패');
    }
  }

}