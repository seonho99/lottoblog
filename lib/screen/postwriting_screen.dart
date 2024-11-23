import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottoblog/service/firebase_storage_service.dart';
import '../widget/imagepicker_widget.dart';

class PostwritingScreen extends StatefulWidget {
  final String userId;

  PostwritingScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<PostwritingScreen> createState() => _PostwritingScreenState();
}

class _PostwritingScreenState extends State<PostwritingScreen> {
  final TextEditingController _textControllerTitle = TextEditingController();
  final TextEditingController _textControllerContents = TextEditingController();
  final FirebaseStorageService firebaseStorageService = FirebaseStorageService();

  int _totalLengthTitle = 0;
  int _totalLengthContents = 0;
  final int _maxLengthTitle = 30;
  final int _maxLengthContents = 200;

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
    try {
      if (_textControllerTitle.text.isEmpty || _textControllerContents.text.isEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('오류'),
              content: Text('제목과 내용을 모두 입력해야 합니다.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '확인',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            );
          },
        );
        return;
      }


      // 필드 초기화
      _textControllerTitle.clear();
      _textControllerContents.clear();

      // 성공 메시지 표시
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('성공'),
            content: Text('게시글이 작성되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // 에러 처리
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('오류'),
            content: Text('게시글 작성에 실패했습니다: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    }
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black54),
                    borderRadius: BorderRadius.circular(4),
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
                            ?.copyWith(color: Colors.black54),
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
                          ?.copyWith(color: Colors.black54),
                    ),
                  ],
                ),
                ImagepickerWidget(),
                SizedBox(height: 30),
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black54),
                    borderRadius: BorderRadius.circular(4),
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
                            ?.copyWith(color: Colors.black54),
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
                          ?.copyWith(color: Colors.black54),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _submitPost,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text("게시글 작성", style: Theme.of(context).textTheme.titleSmall),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
