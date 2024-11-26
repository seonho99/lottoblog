import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class FirebaseStorageService {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final storageRef = FirebaseStorage.instance.ref();

  Future<String> uploadProfileImage(File imageFile, String? uid) async {
    if (uid == null) throw Exception('잘못된 접근입니다');
    try {
      final profileRef =
      storageRef.child('user_profiles/${uid}_profile_image.jpg');
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
    if (uid == null) throw Exception('잘못된 접근입니다');
    try {
      final profileRef =
      storageRef.child('user_profiles/${uid}_profile_image.jpg');
      await profileRef.delete();
    } catch (e) {
      throw Exception('upload 실패');
    }
  }


  Future<void> uploadFile(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      try {
        await storage.ref('uploads/${pickedFile.name}').putFile(file);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('파일 업로드 성공')),
        );
      } on FirebaseException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('파일 업로드 실패: ${e.message}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('이미지가 선택되지 않았습니다')),
      );
    }
  }



}