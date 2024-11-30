import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/bloc/post/post_bloc.dart';
import '../data/bloc/post/post_event.dart';
import '../data/bloc/post/post_state.dart';
import '../data/repository/post_repository.dart';
import '../service/firestore_service.dart';

class ListofPostsScreen extends StatelessWidget {
  final String uid;

  const ListofPostsScreen({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 목록'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => PostBloc(PostRepository(FireStoreService()))..add(PostGetAllPostsEvent(uid)),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PostLoadedState) {
              // 게시글이 로딩된 상태에서 표시
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.content),
                    leading: post.imageUrls.isNotEmpty
                        ? Image.network(post.imageUrls[0], width: 50, height: 50, fit: BoxFit.cover)
                        : Icon(Icons.image),
                  );
                },
              );
            } else if (state is PostErrorState) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
