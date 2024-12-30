import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottoblog/widget/imagepicker_widget.dart';

class PostwritingScreen extends StatefulWidget {
  const PostwritingScreen({super.key});

  @override
  State<PostwritingScreen> createState() => _PostwritingScreenState();
}

class _PostwritingScreenState extends State<PostwritingScreen> {
  final TextEditingController _textControllerTitle = TextEditingController();
  final TextEditingController _textControllerContents = TextEditingController();

  void _onChangedTitle(String text) {
    if (text.length > 30) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('제목이 30자를 넘겼습니다.')),
      );
      _textControllerTitle.text = text.substring(0, 30);
      _textControllerTitle.selection = TextSelection.collapsed(offset: 30);
    }
  }

  void _onChangedContent(String text) {
    if (text.length > 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('내용이 200자를 넘겼습니다.')),
      );
      _textControllerContents.text = text.substring(0, 200);
      _textControllerContents.selection = TextSelection.collapsed(offset: 200);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ImagepickerWidget()),
                );
              },
              icon: Icon(Icons.photo_camera_outlined, size: 40),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff05D686),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                '등록',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w800),
              ),
            ),
          ],
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
                    LengthLimitingTextInputFormatter(30),
                  ],
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: Colors.black),
                  decoration: InputDecoration(
                      hintText: '제목',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.w800),
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.black54),
                SizedBox(height: 10),
                TextFormField(
                  controller: _textControllerContents,
                  keyboardType: TextInputType.text,
                  onChanged: _onChangedContent,
                  maxLines: null,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.black,height: 1.6),
                  decoration: InputDecoration(
                      hintText: '내용을 입력해주세요',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                      border: InputBorder.none,
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
