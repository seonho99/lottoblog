import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseStorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final storageRef = FirebaseStorage.instance.ref();
  final _fs = FirebaseFirestore.instance;

  Future<String> uploadProfileImage(
      Uint8List bytes, String path, String? uid) async {
    if (uid == null) throw Exception('잘못된 접근 입니다');
    try {
      final profileRef =
          storageRef.child('user_profiles/${uid}_profile_image.jpg');
      final metadata = SettableMetadata(
        contentType: 'image/png',
        customMetadata: {'picked-file-path': path},
      );
      await profileRef.putData(bytes, metadata);

      final downloadUrl = await profileRef.getDownloadURL();

      final userDocRef = _fs.collection('users').doc(uid);
      final docSnapshot = await userDocRef.get();

      if (!docSnapshot.exists) {
        await userDocRef.set({
          'profileImageUrl': downloadUrl,
        });
        print("New user document created with profile image.");
      } else {
        await userDocRef.update({
          'profileImageUrl': downloadUrl,
        });
        print("User document updated with new profile image.");
      }
      return downloadUrl;
    } catch (e) {
      throw Exception('upload 실패');
    }
  }

  Future<void> deleteProfileImage(String? uid) async {
    if (uid == null) throw Exception('잘못된 접근입니다');
    try {
      final profileRef =
          storageRef.child('user_profiles/${uid}_profile_image.jpg');
      await profileRef.delete();
    } catch (e) {
      throw Exception('upload 실패');
    }
  }


  Future<List<String>> uploadImages(List<File> imageFiles) async {
    List<String> imageUrls = [];

    for (var file in imageFiles) {
      try {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('post_images')
            .child('${DateTime
            .now()
            .millisecondsSinceEpoch}.jpg');

        await storageRef.putFile(file);

        final downloadUrl = await storageRef.getDownloadURL();
        imageUrls.add(downloadUrl);
      } catch (e) {
        throw Exception('이미지 업로드에 실패했습니다: $e');
      }
    }

    return imageUrls;
  }

  // Future<List<String>> uploadPostImages(
  //     List<Uint8List> bytesList, List<String> paths, String? postId) async {
  //   if (postId == null) throw Exception('잘못된 접근 입니다');
  //
  //   List<String> downloadUrls = [];
  //
  //   try {
  //     for (int i = 0; i < bytesList.length; i++) {
  //       final imageBytes = bytesList[i];
  //       final imagePath = paths[i];
  //
  //       final profileRef =
  //       storageRef.child('post_profiles/${postId}_profile_image_${i}.jpg');
  //       final metadata = SettableMetadata(
  //         contentType: 'image/png',
  //         customMetadata: {'picked-file-path': imagePath},
  //       );
  //
  //       await profileRef.putData(imageBytes, metadata);
  //
  //       final downloadUrl = await profileRef.getDownloadURL();
  //       downloadUrls.add(downloadUrl);
  //
  //       print("Image uploaded: $downloadUrl");
  //     }
  //
  //     final postDocRef = _fs.collection('posts').doc(postId);
  //     final docSnapshot = await postDocRef.get();
  //
  //     if (!docSnapshot.exists) {
  //       await postDocRef.set({
  //         'imageUrls': downloadUrls,
  //       });
  //
  //       print("New post document created with images.");
  //
  //     } else {
  //       await postDocRef.update({
  //         'imageUrls': downloadUrls,
  //       });
  //
  //       print("Post document updated with new images.");
  //     }
  //     return downloadUrls;
  //   } catch (e) {
  //     throw Exception('upload 실패');
  //   }
  // }
}
