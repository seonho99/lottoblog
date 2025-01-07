import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottoblog/models/post_model.dart';
import 'package:lottoblog/service/firebase_storage_service.dart';

import '../data/bloc/post/post_bloc.dart';
import '../data/bloc/post/post_event.dart';

class PostwritingScreen extends StatefulWidget {
  const PostwritingScreen({super.key});

  @override
  State<PostwritingScreen> createState() => _PostwritingScreenState();
}


class _PostwritingScreenState extends State<PostwritingScreen> {
  ImagePicker picker = ImagePicker();
  File? selectedImage;
  List<File> selectedImages = [];

  final TextEditingController _textControllerTitle = TextEditingController();
  final TextEditingController _textControllerContents = TextEditingController();
  final FirebaseStorageService _storageService = FirebaseStorageService();

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

  Future<void> pickImageFromGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        selectedImage = File(image.path);
        selectedImages.add(selectedImage!);
      });
    }
  }

  void _removeImage(int index){
    setState(() {
      selectedImages.removeAt(index);
    });
  }



  Widget _imageGallery(){
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0),
      itemCount: selectedImages.length,
      itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                color: Colors.black,
                width: double.infinity,
                height: MediaQuery.of(context).size.width*0.8,
                child: Image.file(selectedImages[index],
                fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 5,
                  top: 5,
                  child: IconButton(
                      onPressed: ()=> _removeImage(index),
                      icon: Icon(Icons.delete,color: Colors.grey,)))
            ],
          );
      },
    );
  }

  void _clearFields(){

    setState(() {
      _textControllerTitle.clear();
      _textControllerContents.clear();
      selectedImages.clear();
    });
  }

  Future<List<String>> uploadImages() async {
    List<String> imageUrls = await _storageService.uploadImages(selectedImages);
    return imageUrls;
  }

  void _submitPost() async {
    String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
    List<String> imageUrls = await uploadImages();

    if(_textControllerTitle.text.trim().isEmpty || _textControllerContents.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('제목과 내용을 입력해주세요.'))
      );
      return ;
    }

    final posts = PostModel(
      title: _textControllerTitle.text.trim(),
      content: _textControllerContents.text.trim(),
      imageUrls: imageUrls,
      createdAt: DateTime.now(),
      uid: uid,
      likeCount: 0,
      reportCount: 0,
      postId: '',
    );

    context.read<PostBloc>().add(CreatePost(posts: posts));

    _clearFields();

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('게시물이 등록되었습니다.'))
    );
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
              onPressed: pickImageFromGallery,
              icon: Icon(Icons.add_a_photo_outlined, size: 45),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: _submitPost,
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
                SizedBox(height: 20),
                _imageGallery(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
