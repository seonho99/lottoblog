import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottoblog/firebase/post_service.dart';
import 'package:lottoblog/models/post_model.dart';
import 'imagepicker_widget.dart';

class PostwritingScreen extends StatefulWidget {
  PostwritingScreen({super.key});

  @override
  State<PostwritingScreen> createState() => _PostwritingScreenState();
}

class _PostwritingScreenState extends State<PostwritingScreen> {
  final TextEditingController _textControllerTitle = TextEditingController();
  final TextEditingController _textControllerContents = TextEditingController();
  final PostService postService = PostService(); // PostService 인스턴스 생성

  int _totalLengthTitle = 0;
  int _totalLengthContents = 0;
  final int _maxLengthTitle = 30;
  final int _maxLengthContents = 200;

  void _onChangedTitle(String text) {
    setState(() {
      _totalLengthTitle = text.length;
    });
  }

  void _onChangedContents(String text) {
    setState(() {
      _totalLengthContents = text.length;
    });
  }

  Future<void> _submitPost() async {
    // postId와 작성 시간 생성
    String postId = FirebaseFirestore.instance.collection('posts').doc().id;
    DateTime createdAt = DateTime.now();

    // PostModel 객체 생성
    final post = PostModel(
      postId: postId,
      title: _textControllerTitle.text,
      content: _textControllerContents.text,
      likeCount: 0,
      imageUrls: [], // 이미지 URL 리스트 설정
      createdAt: createdAt,
      authorId: 'sampleUserId',
      blockedUserIds: [],
      reportCount: 0,
    );

    // Firestore에 데이터 저장
    await postService.addPost(post);

    // 등록 후 피드백 제공 또는 화면 이동
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('게시물이 등록되었습니다!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          '글 작성',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: TextField(
                      style: Theme.of(context).textTheme.titleLarge,
                      keyboardType: TextInputType.text,
                      controller: _textControllerTitle,
                      onChanged: _onChangedTitle,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                      decoration: InputDecoration(
                        hintText: '제목을 입력해주세요.',
                        border: InputBorder.none,
                        hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${_totalLengthTitle}/${_maxLengthTitle}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                ImagepickerWidget(),
                SizedBox(height: 30),
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      maxLines: 14,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(height: 1.6),
                      keyboardType: TextInputType.text,
                      controller: _textControllerContents,
                      onChanged: _onChangedContents,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(200),
                      ],
                      decoration: InputDecoration(
                        hintText: '글을 작성해주세요.',
                        border: InputBorder.none,
                        hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${_totalLengthContents}/${_maxLengthContents}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _submitPost,
                      child: Text('등록'),
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
