import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/show_snackbar.dart';
import 'firebase_aut_service.dart';

class PersonalScreen extends StatelessWidget {
  PersonalScreen({super.key});
  final auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/profile_dummy/profile_01.png'),
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
                      context.go('/personal_screen/editprofile_screen');
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
              SizedBox(height: 30),
              Divider(height: 1, color: Colors.grey.shade400),
              SizedBox(height: 30),
              Text('블로그', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  context.go('/personal_screen/blogwriting_screen');
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
              SizedBox(height: 20),
              Divider(height: 1, color: Colors.grey.shade200),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.go('/personal_screen/listofposts_screen');
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.auto_stories,
                          size: 30,
                          color: Theme.of(context).colorScheme.secondary),
                      SizedBox(width: 15),
                      Text('글 목록',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Divider(height: 1, color: Colors.grey.shade200),
              SizedBox(height: 30),
              Text('내정보', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 30),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (auth.isLoggedIn()) {
                          auth.signOut().then((_) {
                            showSnackBar(context, '로그아웃되었습니다.');
                          }).catchError((error) {
                            showSnackBar(context, error.toString());
                          });
                        } else {
                          context.go('/login_screen');
                        }
                        ;
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              auth.isLoggedIn() ? '로그아웃' : '로그인',
                            )
                          ],
                        ),
                      ),
                    ),

                    // ItemCard(
                    // title: auth.isLoggedIn()?'로그아웃':'로그인',
                    // color: (brightness == Brightness.light)
                    //     ? Colors.white
                    //     : Theme.of(context).scaffoldBackgroundColor,
                    // rightWidget: null,
                    // callback: () {
                    //   if(auth.isLoggedIn()){
                    //     auth.signOut().then((_) {
                    //       showSnackBar(context, '로그아웃되었습니다.');
                    //     }).catchError((error) {
                    //       showSnackBar(context, error.toString());
                    //     });
                    //   }else{
                    //     context.go('/login_screen');
                    //   }
                    // },
                    // ),
                    //   Icon(Icons.login,
                    //       size: 30,
                    //       color: Theme.of(context).colorScheme.secondary),
                    //   SizedBox(width: 15),
                    //   Text('로그인',
                    //       style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(height: 1, color: Colors.grey.shade200),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              Divider(height: 1, color: Colors.grey.shade200),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              Divider(height: 1, color: Colors.grey.shade200),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget _buildMyPageSection(BuildContext context) {
//   return Card(
//     elevation: 2,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//     child: Padding(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('활동', style: Theme.of(context).textTheme.titleLarge),
//           SizedBox(height: 16),
//           _buildListTile(context, Icons.favorite, '좋아요한 글', Colors.red),
//           _buildListTile(context, Icons.bookmark, '저장한 글', Colors.green),
//         ],
//       ),
//     ),
//   );
// }

//   Widget _buildListTile(BuildContext context, IconData icon, String title, Color iconColor) {
//     return ListTile(
//       leading: Icon(icon, color: iconColor),
//       title: Text(title),
//       trailing: Icon(Icons.chevron_right),
//       onTap: () {},
//     );
//   }
