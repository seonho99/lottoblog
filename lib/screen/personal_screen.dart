import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/service/firebase_auth_service.dart';

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
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.black54),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: profileImgaeURL != null
                                  ? NetworkImage(profileImgaeURL!)
                                  : AssetImage(
                                      'assets/profile_dummy/profile_01.png'),
                              onError: (_, __) {
                                setState(() {
                                  profileImgaeURL = null;
                                });
                              },
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '사용자',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.go('/login/email_login/personal/editprofile');
                      },
                      label: Text('수정'),
                      icon: Icon(Icons.edit, size: 18),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54,
                        foregroundColor:
                            Theme.of(context).colorScheme.onSecondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child:
                    Text('블로그', style: Theme.of(context).textTheme.titleLarge),
              ),
              Flexible(
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black54,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go('/login/email_login/personal/postwriting');
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(Icons.edit_document,
                                    size: 25,
                                    color:
                                        Theme.of(context).colorScheme.secondary),
                              ),
                              Text('글 작성',
                                  style:
                                      Theme.of(context).textTheme.titleLarge)
                            ],
                          ),
                        ),
                      ),
                      Divider(height: 1, color: Colors.black54),
                      GestureDetector(
                        onTap: () {
                          context.go('/login/email_login/personal/listofposts');
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(Icons.subject,
                                    size: 25,
                                    color:
                                        Colors.black54),
                              ),

                              Text('글 목록',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 20),
                child: Text('내정보',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Flexible(
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black54,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(Icons.campaign,
                                  size: 25,
                                  color: Colors.black54),
                            ),
                            Text('공지사항',
                                style:
                                    Theme.of(context).textTheme.titleLarge),
                          ],
                        ),
                      ),
                      Divider(height: 1, color: Colors.black54),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(Icons.help_outline,
                                  size: 25,
                              color: Colors.black54)
                            ),
                            Text('고객센터/도움말',
                                style: Theme.of(context).textTheme.titleLarge),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
