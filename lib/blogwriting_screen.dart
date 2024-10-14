import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'imagepicker_widget.dart';

class BlogWritingScreen extends StatefulWidget {
  BlogWritingScreen({super.key});

  @override
  State<BlogWritingScreen> createState() => _BlogWritingScreenState();
}

class _BlogWritingScreenState extends State<BlogWritingScreen> {
  final TextEditingController _textControllerTitle = TextEditingController();
  final TextEditingController _textControllerContents = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text('글 작성', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),),
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
                    Text('${_totalLengthTitle}/${_maxLengthTitle}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey)
                      // style: TextStyle(color: Colors.grey,fontSize: 16),
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
                    Text('${_totalLengthContents}/${_maxLengthContents}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
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