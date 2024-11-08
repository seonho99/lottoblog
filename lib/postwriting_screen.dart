import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottoblog/models/post_model.dart';
import 'imagepicker_widget.dart';
import 'firebase/firestore_service.dart';

class PostwritingScreen extends StatefulWidget {
  final String userId;

  PostwritingScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<PostwritingScreen> createState() => _PostwritingScreenState();
}

class _PostwritingScreenState extends State<PostwritingScreen> {
  final TextEditingController _textControllerTitle = TextEditingController();
  final TextEditingController _textControllerContents = TextEditingController();
  final FirestoreService firestoreService = FirestoreService();
  List<String> _imageUrls = [];
  final ImagePicker _imagePicker = ImagePicker();

  int _totalLengthTitle = 0;
  int _totalLengthContents = 0;
  final int _maxLengthTitle = 30;
  final int _maxLengthContents = 200;

  // Future<void> _selectImage() async {
  //   final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null){
  //     String imageUrl = await uploadImage(File(pickedFile.path));
  //     setState(() {
  //       _imageUrls.add(imageUrl);
  //     });
  //   }
  // }


  void _onChangedTitle(String text) {
    setState(() {
      _totalLengthTitle = text.length;
    });
  }

  void _onChangedContent(String text) {
    setState(() {
      _totalLengthContents = text.length;
    });
  }

  void _submitPost() async {
    if(_textControllerTitle.text.isEmpty || _textControllerTitle.text.isEmpty){
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('오류'),
              content: Text('제목과 내용을 모두 입력해야 합니다.'),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('확인'),
                ),
              ],
            );
          },
      );
      return;
    }
    final newPost = PostModel(
      postId: '',
      title: _textControllerTitle.text,
      content: _textControllerContents.text,
      createdAt: DateTime.now(),
      authorId: widget.userId,
      likeCount: 0,
      reportCount: 0,
    );

    // DocumentReference docRef = await _firestoreService.addPost(newPost);
    // newPost.postId = docRef.id;
    // print('게시글이 추가되었습니다: ${newPost.postId}');

    _textControllerTitle.clear();
    _textControllerTitle.clear();
    _imageUrls.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          '글 작성',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
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
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.grey),
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
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey),
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
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(height: 1.6),
                      keyboardType: TextInputType.text,
                      controller: _textControllerContents,
                      onChanged: _onChangedContent,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(200),
                      ],
                      decoration: InputDecoration(
                        hintText: '글을 작성해주세요.',
                        border: InputBorder.none,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.grey),
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
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _submitPost,
                  child: Text("게시글 작성"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
