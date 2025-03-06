import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottoblog/screen/my_post_screen/post_update_tile.dart';
import 'package:lottoblog/service/firebase_auth_service.dart';

import '../../data/bloc/post/post_bloc.dart';
import '../../data/bloc/post/post_event.dart';
import '../../data/bloc/post_screen/post_screen_bloc.dart';
import '../../data/bloc/post_screen/post_screen_event.dart';
import '../../data/bloc/post_screen/post_screen_state.dart';
import '../../models/post_model.dart';
import '../../service/firebase_storage_service.dart';
import 'my_post_title.dart';
import 'my_post_user.dart';

class PostUpdateScreen extends StatefulWidget {
  String postId;

  PostUpdateScreen({
    super.key,
    required this.postId,
  });

  @override
  State<PostUpdateScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<PostUpdateScreen> {
  ImagePicker picker = ImagePicker();
  File? selectedImage;
  List<File> selectedImages = [];
  TextEditingController _textControllerTitle = TextEditingController();
  TextEditingController _textControllerContent = TextEditingController();
  final _storageService = FirebaseStorageService();

  @override
  void initState() {
    super.initState();
    context.read<PostScreenBloc>().add(FetchPostEvent(postId: widget.postId));
  }

  Future<List<String>> uploadImages() async {
    List<String> imageUrls = await _storageService.uploadImages(selectedImages);
    return imageUrls;
  }

  void _submitPost() async {
    String uid = FirebaseAuth.instance.currentUser?.uid ?? '';

    if (_textControllerTitle.text.trim().isEmpty || _textControllerContent.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('제목과 내용을 입력해주세요.')),
      );
      return;
    }

    List<String> imageUrls = await uploadImages();

    final post = PostModel(
      title: _textControllerTitle.text.trim(),
      content: _textControllerContent.text.trim(),
      imageUrls: imageUrls,
      uid: uid,
      postId: widget.postId,
    );

    context.read<PostBloc>().add(CreatePost(posts: post));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('게시물이 수정되었습니다.')),
    );
  }


  Future<void> pickImageFromGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImages.add(File(image.path));
      });
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
              onPressed: pickImageFromGallery,
              icon: Icon(
                Icons.add_a_photo_outlined,
                size: 45,
              ),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: _submitPost,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                '수정하기',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<PostScreenBloc, PostScreenState>(
            builder: (context, state) {
              if (state is PostScreenInitial) {
                return Container();
              } else if (state is PostScreenSuccess) {
                final post = state.fetchPostScreen!;
                _textControllerTitle.text = post.title;
                _textControllerContent.text = post.content;
                

                // print('post: ${state.fetchPostScreen}');
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyPostUser(uid: post.uid ?? ''),
                        SizedBox(height: 20),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1.0,
                        ),
                        SizedBox(height: 30),
                        // PostUpdateTile(postId: widget.postId, title: post.title,imageUrls: post.imageUrls ,content: post.content, )
                        TextField(
                          controller: _textControllerTitle,
                          maxLength: 30,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                          ),
                          itemCount: selectedImages.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Image.file(
                                  selectedImages[index],
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100,
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: _textControllerContent,
                          maxLength: 200,
                          maxLines: 10,
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(height: 2
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is PostScreenFailure) {
                return Center(
                  child: Text('실패: ${state.errorMessage}'),
                );
              }
              return Center(
                child: Text('데이터 불러오기 실패'),
              );
            },
          ),
        ),
      ),
    );
  }
}
