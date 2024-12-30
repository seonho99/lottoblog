import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/bloc/post/post_bloc.dart';
import '../data/bloc/post/post_state.dart';

class ListofPostsScreen extends StatelessWidget {
  const ListofPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시글 목록'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
