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
          padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey.shade300),
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
                    ),
                    Expanded(
                      child: Text(
                        '윈터',
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
                        backgroundColor: Colors.grey,
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
                      color: Colors.grey.shade300,
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
                              Icon(Icons.edit_document,
                                  size: 30,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              SizedBox(width: 15),
                              Text('글 작성',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall)
                            ],
                          ),
                        ),
                      ),
                      Divider(height: 1, color: Colors.grey.shade300),
                      GestureDetector(
                        onTap: () {
                          context.go('/login/email_login/personal/listofposts');
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Icon(Icons.subject,
                                  size: 30,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              SizedBox(width: 15),
                              Text('글 목록',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
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
                      color: Colors.grey.shade300,
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
                            Icon(Icons.campaign,
                                size: 30,
                                color: Theme.of(context).colorScheme.secondary),
                            SizedBox(width: 15),
                            Text('공지사항',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
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
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
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
