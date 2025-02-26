
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/data/bloc/login/login_event.dart';
import 'package:lottoblog/data/bloc/login/login_state.dart';
import 'package:lottoblog/screen/edit_profile/edit_image_picker.dart';
import 'package:lottoblog/service/firebase_auth_service.dart';
import 'package:lottoblog/service/firebase_storage_service.dart';
import 'package:lottoblog/show_snackbar.dart';

import '../../data/bloc/login/login_bloc.dart';

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
        title: Text(
          '프로필 수정',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
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
                EditImagePicker(),
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
                        if (auth.user?.emailVerified ?? false) {
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
                    child: Text(
                      '수정',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                // 로그아웃/회원탈퇴
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(Logout());
                      },
                      child: Text('로그아웃',
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                    Text('|'),
                    TextButton(
                      onPressed: () async {
                        try {
                          await auth.deleteAccount();
                          showSnackBar(context, '탈퇴처리가 완료되었습니다.');
                          context.go('/login');
                        } catch (e) {
                          showSnackBar(context, e.toString());
                        }
                      },
                      child: Text(
                        '회원탈퇴',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginUnAuthenticated) {
                          context.go('/login');
                        }
                        if (state is LoginFailure) {
                          showSnackBar(context, state.message);
                        }
                      },
                      child: Container(),
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
