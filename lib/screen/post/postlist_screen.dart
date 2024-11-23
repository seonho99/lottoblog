import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/post_model.dart';


class PostListScreen extends StatefulWidget {
  final String postId; // 특정 게시물 ID를 받음

  PostListScreen({required this.postId});

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  PostModel? post; // 특정 게시물 정보

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  Future<void> fetchPost() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('posts')
        .get();

    for (var doc in querySnapshot.docs) {
      var data= doc.data() as Map<String, dynamic>;
      print('Title:${data['title']},Content:${data['content']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Detail"),
      ),
      body: post == null
          ? Center(child: CircularProgressIndicator()) // 로딩 인디케이터
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post!.title, style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 10),
            Text("Title: ${post!.title}", style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 20),
            Text(post!.content, style: Theme.of(context).textTheme.headlineSmall),
            // imageUrls와 같은 다른 데이터도 추가 가능
          ],
        ),
      ),
    );
  }
}
