import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/show_snackbar.dart';
import 'firebase/firebase_auth_service.dart';

class PersonalScreen extends StatefulWidget {
  PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final auth = FirebaseAuthService();
  String? profileImgaeURL;

  @override
  void initState() {
    super.initState();
    profileImgaeURL = auth.user?.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade200),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: profileImgaeURL != null
                              ? NetworkImage(profileImgaeURL!)
                              : AssetImage(
                                  'assets/profile_dummy/profile_03.png'),
                          onError: (_, __) {
                            setState(() {
                              profileImgaeURL = null;
                            });
                          },
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '이름',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.go('/login/emaillogin/personal/editprofile');
                    },
                    icon: Icon(Icons.edit, size: 18),
                    label: Text('수정'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      foregroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ],
              ),
              Divider(height: 1, color: Colors.grey.shade400),
              Text('블로그', style: Theme.of(context).textTheme.titleLarge),
              GestureDetector(
                onTap: () {
                  context.go('/login/emaillogin/personal/postwriting');
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.edit_document,
                          size: 30,
                          color: Theme.of(context).colorScheme.secondary),
                      SizedBox(width: 15),
                      Text('글 작성',
                          style: Theme.of(context).textTheme.headlineSmall)
                    ],
                  ),
                ),
              ),
              Divider(height: 1, color: Colors.grey.shade200),
              GestureDetector(
                onTap: () {
                  context.go('/login/emaillogin/personal/listofposts');
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.subject,
                          size: 30,
                          color: Theme.of(context).colorScheme.secondary),
                      SizedBox(width: 15),
                      Text('글 목록',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
              ),
              Divider(height: 1, color: Colors.grey.shade200),
              Text('내정보', style: Theme.of(context).textTheme.titleLarge),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.campaign,
                        size: 30,
                        color: Theme.of(context).colorScheme.secondary),
                    SizedBox(width: 15),
                    Text('공지사항',
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              ),
              Divider(height: 1, color: Colors.grey.shade200),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.help_outline,
                        size: 30,
                        color: Theme.of(context).colorScheme.secondary),
                    SizedBox(width: 15),
                    Text('고객센터/도움말',
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              ),
              Divider(height: 1, color: Colors.grey.shade200),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    height: 60,
                    decoration: BoxDecoration(color: Colors.white),
                    child: InkWell(
                      onTap: () {
                        if (auth.isLoggedIn()) {
                          auth.signOut().then((_) {
                            showSnackBar(context, '로그아웃 되었습니다.');
                          }).catchError((error) {
                            showSnackBar(context, error.toString());
                          });
                        } else {
                          context.go('/login_screen');
                        }
                      },
                      child: Center(
                        child: Text(
                          auth.isLoggedIn() ? '로그아웃' : '로그인',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(height: 1, color: Colors.grey.shade200),
            ],
          ),
        ),
      ),
    );
  }
}
