import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/post/post_event.dart';
import 'package:lottoblog/models/post_model.dart';
import 'package:lottoblog/widget/imagepicker_widget.dart';

import '../data/bloc/post/post_bloc.dart';

class PostwritingScreen extends StatefulWidget {
  final String userId;

  PostwritingScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<PostwritingScreen> createState() => _PostwritingScreenState();
}

class _PostwritingScreenState extends State<PostwritingScreen> {
  final TextEditingController _textControllerTitle = TextEditingController();
  final TextEditingController _textControllerContents = TextEditingController();

  final int _maxLengthTitle = 30;
  final int _maxLengthContents = 200;
  List<String> _imageUrls = [];  // 이미지 URL 리스트 추가

  void _onChangedTitle(String text) {
    if (text.length > _maxLengthTitle) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('제목이 30자를 넘겼습니다.')),
      );
      _textControllerTitle.text = text.substring(0, _maxLengthTitle);
      _textControllerTitle.selection =
          TextSelection.collapsed(offset: _maxLengthTitle);
    }
  }

  void _onChangedContent(String text) {
    if (text.length > _maxLengthContents) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('내용이 200자를 넘겼습니다.')),
      );
      _textControllerContents.text = text.substring(0, _maxLengthContents);
      _textControllerContents.selection =
          TextSelection.collapsed(offset: _maxLengthContents);
    }
  }

  void _onImageSelected(List<String> selectedImageUrls) {
    setState(() {
      _imageUrls = selectedImageUrls;
    });
  }

  void _submitPost() {
    final postBloc = BlocProvider.of<PostBloc>(context);
    final title = _textControllerTitle.text;
    final content = _textControllerContents.text;

    if (title.isEmpty || content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('제목과 내용 모두 입력해야 합니다.')),
      );
      return;
    }

    final postModel = PostModel(
      title: title,
      content: content,
      uid: widget.userId,
      imageUrls: _imageUrls,
      createdAt: DateTime.now(),
    );

    postBloc.add(PostSubmittedEvent(postModel));

    _textControllerTitle.clear();
    _textControllerContents.clear();
    setState(() {
      _imageUrls.clear();  // 이미지 리스트 초기화
    });

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('성공'),
            content: Text('게시글이 작성되었습니다'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          '블로그 작성',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _textControllerTitle,
                  keyboardType: TextInputType.text,
                  onChanged: _onChangedTitle,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(_maxLengthTitle),
                  ],
                  decoration: InputDecoration(
                      labelText: '제목',
                      labelStyle: Theme.of(context).textTheme.headlineSmall,
                      border: UnderlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
                ImagePickerWidget(onImageSelected: _onImageSelected),  // 이미지 선택 처리
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black54),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        maxLines: 14,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(height: 1.6),
                        keyboardType: TextInputType.text,
                        controller: _textControllerContents,
                        onChanged: _onChangedContent,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(200),
                        ],
                        decoration: InputDecoration(
                          hintText: '내용을 작성 해주세요.',
                          border: InputBorder.none,
                          hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _submitPost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text("게시글 작성",
                      style: Theme.of(context).textTheme.titleSmall),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
