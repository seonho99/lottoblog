import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottoblog/show_snackbar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isUploading = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    setState(() {
      _isUploading = true;
    });


    setState(() {
      _isUploading = false;
    });
  }

  @override
  void initState() {
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
            Text('프로필 수정', style:Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold)),
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
                                  'assets/profile_dummy/profile_01.png'),
                          child: _isUploading
                            ? CircularProgressIndicator()
                          :  Icon(Icons.camera_alt,
                              size: 30, color: Colors.white),
                          onBackgroundImageError: (_,__){
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
                              color: Colors.grey, shape: BoxShape.circle),
                          child: Center(
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.close, color: Colors.white),
                              onPressed: () async{
                                try {
                                  await auth.deletePhotoUrl();
                                  await storage.deleteProfileImage(auth.user?.uid);
                                } catch(e) {
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
                      onPressed: () {
                        if(auth.user?.emailVerified??false){
                          showSnackBar(context, '이미 인증된 사용자입니다.');
                          return;
                        }
                        try {
                          auth.sendVerificationEmail();
                          showSnackBar(context, '인증 이메일이 다시 전송되었습니다.');
                        } catch (e) {
                          showSnackBar(context, e.toString());
                        }
                      },
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
                            ?.copyWith(color: Colors.white),),
                  ),
                ),
                // 로그아웃/회원탈퇴
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () async {
                        try {
                          await auth.signOut();
                          context.go('/login');
                        } catch (e) {
                          showSnackBar(context, toString());
                        }
                      },
                      child: Text(
                        '로그아웃',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Text('|'),
                    TextButton(
                      onPressed: () async {
                        try{
                          await auth.deleteAccount();
                          showSnackBar(context, '탈퇴처리가 완료되었습니다.');
                          context.go('/login');
                        }catch(e){
                          showSnackBar(context, e.toString());
                        }
                      },
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
