import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottoblog/data/bloc/post/post_state.dart';

import '../../data/bloc/post/post_bloc.dart';
import '../../service/firebase_storage_service.dart';

class PostUpdateScreen extends StatefulWidget {
  String postId;

  PostUpdateScreen({super.key, required this.postId});

  @override
  State<PostUpdateScreen> createState() => _PostUpdateScreenState();
}

class _PostUpdateScreenState extends State<PostUpdateScreen> {
  ImagePicker picker = ImagePicker();
  File? selectedImage;
  List<File> selectedImages = [];
  TextEditingController _textControllerTitle = TextEditingController();
  TextEditingController _textControllerContents = TextEditingController();
  final _storageService = FirebaseStorageService();

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
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        selectedImages.add(selectedImage!);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
  }


  Widget _imageGallery() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
      itemCount: selectedImages.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              color: Colors.black,
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.8,
              child: Image.file(
                selectedImages[index],
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 5,
              top: 5,
              child: IconButton(
                onPressed: () => _removeImage(index),
                icon: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _clearFields() {
    setState(() {
      _textControllerTitle.clear();
      _textControllerContents.clear();
      selectedImages.clear();
    });
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
              onPressed: () {},
              icon: Icon(Icons.add_a_photo_outlined, size: 45),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff05D686),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                '수정하기',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
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
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  if (state is PostInitial) {
                    return Container(child: Text('초기값 입니다.'));
                } else if (state is PostsSuccess){
                    return
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
