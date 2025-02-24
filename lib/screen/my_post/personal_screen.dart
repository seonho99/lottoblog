import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/data/bloc/profile/profile_event.dart';
import 'package:lottoblog/data/bloc/profile/profile_state.dart';
import 'package:lottoblog/screen/my_post/personal_tile.dart';

import '../../data/bloc/my_post/my_post_bloc.dart';
import '../../data/bloc/my_post/my_post_event.dart';
import '../../data/bloc/my_post/my_post_state.dart';
import '../../data/bloc/profile/profile_bloc.dart';
import 'my_post_tile.dart';

class PersonalScreen extends StatefulWidget {
  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final _scrollController = ScrollController();
  late String uid;

  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      uid = user.uid;
      // print('uid:$uid');
      context.read<ProfileBloc>().add(UpdateProfileEvent(
            uid: uid,
            // userName: userName,
            // profileImageUrl: profileImageUrl,
          ));
      context.read<MyPostBloc>().add(FetchMyPostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 사용자 정보 Row
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  // print('userName: ${state.userName}');
                  // print('profileImageUrl: ${state.profileImageUrl}');

                  if (state is ProfileUpdated && state.user != null) {
                    return PersonalTile(
                      profileImageUrl: state.user!.profileImageUrl,
                      userName: state.user!.userName,
                    );
                  } else if (state is ProfileFailure) {
                    return Center(
                      child: Text('프로필을 불러올 수 없습니다'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go('/personal/editprofile');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.settings_outlined, size: 40),
                        SizedBox(height: 10),
                        Text(
                          '프로필 설정',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 3.0,
                    height: 60,
                    color: Colors.grey.shade300,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go('/personal/postwriting');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.edit_outlined, size: 40),
                        SizedBox(height: 10),
                        Text(
                          '글 작성',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              BlocBuilder<MyPostBloc, MyPostState>(
                builder: (context, state) {
                  if (state is MyPostInitial) {
                    return Center(
                      child: Text('초기 상태'),
                    );
                  } else if (state is MyPostSuccess) {
                    // print('MyPostSuccess: ${state.myPosts}');
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.myPosts.length,
                        itemBuilder: (context, index) {
                          final post = state.myPosts[index];
                          return GestureDetector(
                            onTap: (){
                              final postId = post.postId;
                              context.go('/personal/post/$postId');
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyPostTile(
                                  imageUrl: state.myPosts[index].imageUrls[0],
                                  title: state.myPosts[index].title,
                                  postId: state.myPosts[index].postId ?? '',
                                  likePostCount: state.myPosts[index].likePostCount,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 1.0,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is MyPostFailure) {
                    return Center(child: Text('실패: ${state.errorMessage}'));
                  }
                  return Center(
                    child: Text('데이터 불러오기 실패'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

// void _onScroll() {
//   if (_isBottom && uid != null) {
//     context.read<PostBloc>().add(FetchMyPosts(uid: uid!));
//   }
// }
//
// bool get _isBottom {
//   if (_scrollController.hasClients) return false;
//   final maxScroll = _scrollController.position.maxScrollExtent;
//   final currentScroll = _scrollController.offset;
//   return currentScroll >= (maxScroll * 0.9);
// }
}
