import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../data/bloc/post/post_bloc.dart';
import '../data/bloc/post/post_event.dart';
import '../data/bloc/post/post_state.dart';
import 'my_post_tile.dart';

class PersonalScreen extends StatefulWidget {
  PersonalScreen({super.key});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final _scrollController = ScrollController();
  String? uid;


  @override
  void initState() {
    super.initState();

    final uid = context.read<PostBloc>().getUid();

    if (uid != null) {
      context.read<PostBloc>().add(FetchMyPosts(uid: uid));
    } else {
      print('uid is null');
    }
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
              // 사용자 정보 Row
              Row(
                children: [
                  CircleAvatar(
                    radius: 45,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      '사용자',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
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
                    onTap: (){
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
              BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  if (state is PostInitial) {
                    return Center(child: Text('초기 상태'));
                  } else if (state is PostLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is PostLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyPostTile(
                                imageUrl: state.posts[index].imageUrls[0],
                                title: state.posts[index].title,
                                postId: state.posts[index].postId,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Divider(
                                  color: Colors.grey.shade300,
                                  thickness: 1.0,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  } else if (state is PostFailure) {
                    return Center(child: Text('실패: ${state.errorMessage}'));
                  }
                  return Center();
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

  void _onScroll(){
    if(_isBottom && uid != null){
      context.read<PostBloc>().add(FetchMyPosts(uid: uid!));
    }
  }

  bool get _isBottom {
    if (_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
