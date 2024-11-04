import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottoblog/firebase/firebase_auth_service.dart';
import 'package:lottoblog/firebase/firebase_storage_service.dart';
import 'package:lottoblog/show_snackbar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final auth = FirebaseAuthService();
  final storage = FirebaseStorageService();
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? profileImageURL;
  bool _isUploading = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    setState(() {
      _isUploading = true;
    });
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        String? downloadURL = await storage.uploadProfileImage(
            File(pickedFile.path), auth.user?.uid);

        await auth.updatePhotoUrl(downloadURL);
        setState(() {
          profileImageURL = downloadURL;
        });
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    setState(() {
      _isUploading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = auth.user?.displayName;
    email = auth.user?.email;
    profileImageURL = auth.user?.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Text('프로필 수정', style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: profileImageURL != null
                              ? NetworkImage(profileImageURL!)
                              : const AssetImage(
                                  '/assets/profile_dummy/profile_03.png'),
                          child: _isUploading
                            ? CircularProgressIndicator()
                          :  Icon(Icons.camera_alt,
                              size: 30, color: Colors.white),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: Center(
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.close, color: Colors.white),
                              onPressed: () async{
                                try {
                                  await auth.deletePhotoUrl();
                                  await storage.deleteProfileImage(auth.user?.uid);
                                }catch(e){
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
                ),
                TextFormField(
                  initialValue: name,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이름을 입력하세요';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value;
                  },
                ),
                TextFormField(
                  enabled: false,
                  initialValue: email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'example@example.com',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('이메일 인증을 아직 안하셨나요?',
                        style: Theme.of(context).textTheme.titleSmall),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Send Email',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                // 수정 버튼
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        auth.updateName(name).then((_) {
                          showSnackBar(context, '수정 되었습니다.');
                        }).catchError((e) {
                          showSnackBar(context, e.toString());
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Color(0xff1d2228),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('수정',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.white)),
                  ),
                ),
                // 로그아웃/회원탈퇴
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '로그아웃',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Text('|'),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '회원탈퇴',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
