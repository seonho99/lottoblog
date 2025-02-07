import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../service/firebase_auth_service.dart';
import '../../service/firebase_storage_service.dart';
import '../../show_snackbar.dart';

class EditImagePicker extends StatefulWidget {
  const EditImagePicker({super.key});

  @override
  State<EditImagePicker> createState() => _EditImagePickerState();
}

class _EditImagePickerState extends State<EditImagePicker> {
  final auth = FirebaseAuthService();
  final storage = FirebaseStorageService();
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;
  String? profileImageURL;


  Future<void> _pickImage() async {
    setState(() {
      _isUploading = true;
    });

    String? downloadURL;

    try {
      XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        downloadURL = await storage.uploadProfileImage(
            await pickedFile.readAsBytes(), pickedFile.path, auth.user?.uid);
      }

      setState(() {
        profileImageURL = downloadURL;
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    setState(() {
      _isUploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Stack(
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: profileImageURL != null
                  ? NetworkImage(profileImageURL!)
                  : const AssetImage(
                  'assets/profile_dummy/profile_01.png'),
              child: _isUploading
                  ? CircularProgressIndicator()
                  : Icon(Icons.camera_alt,
                  size: 30, color: Colors.white),
              onBackgroundImageError: (_, __) {
                setState(() {
                  profileImageURL = null;
                });
              },
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey, shape: BoxShape.circle,),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.close, color: Colors.white,),
                  onPressed: () async {
                    try {
                      await auth.deletePhotoUrl();
                      await storage
                          .deleteProfileImage(auth.user?.uid);
                    } catch (e) {
                      showSnackBar(context, e.toString());
                    }
                    setState(() {
                      profileImageURL = null;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
