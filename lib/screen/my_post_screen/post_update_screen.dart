// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:lottoblog/data/bloc/post/post_state.dart';
//
// import '../../data/bloc/post/post_bloc.dart';
// import '../../service/firebase_storage_service.dart';
//
// class PostUpdateScreen extends StatefulWidget {
//   String postId;
//
//   PostUpdateScreen({super.key, required this.postId});
//
//   @override
//   State<PostUpdateScreen> createState() => _PostUpdateScreenState();
// }
//
// class _PostUpdateScreenState extends State<PostUpdateScreen> {
//   ImagePicker picker = ImagePicker();
//   File? selectedImage;
//   List<File> selectedImages = [];
//   TextEditingController _textControllerTitle = TextEditingController();
//   TextEditingController _textControllerContents = TextEditingController();
//   final _storageService = FirebaseStorageService();
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.postId.isNotEmpty) {
//       _textControllerTitle.text = 'Existing Post Content';
//       _textControllerContents.text = 'Existing Post Content';
//       selectedImages.add(File('path_to_existing_image'));
//     }
//   }
//

//

//
//   void _savePost() {
//     if (widget.postId.isNotEmpty) {
//       print('Updateing post with ID: ${widget.postId}');
//     } else {
//       print('Creating a new post');
//     }
//     Navigator.pop(context);
//   }
//
//   Widget _imageGallery() {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 1,
//         crossAxisSpacing: 1.0,
//         mainAxisSpacing: 1.0,
//       ),
//       itemCount: selectedImages.length,
//       itemBuilder: (context, index) {
//         return Stack(
//           children: [
//             Container(
//               color: Colors.black,
//               width: double.infinity,
//               height: MediaQuery.of(context).size.width * 0.8,
//               child: Image.file(
//                 selectedImages[index],
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               right: 5,
//               top: 5,
//               child: IconButton(
//                 onPressed: () => _removeImage(index),
//                 icon: Icon(
//                   Icons.delete,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         scrolledUnderElevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.add_a_photo_outlined,
//                 size: 45,
//               ),
//             ),
//             SizedBox(width: 20),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xff05D686),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Text(
//                 '수정하기',
//                 style: Theme.of(context).textTheme.titleMedium?.copyWith(
//                     color: Colors.white, fontWeight: FontWeight.w800),
//               ),
//             ),
//           ],
//         ),
//       ),
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Container(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   TextField(
//                     controller: _textControllerTitle,
//                     decoration: InputDecoration(
//                       labelText: 'Title',
//                       hintText: 'Enter title here',
//                     ),
//                     maxLength: 30,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextField(
//                     controller: _textControllerContents,
//                     decoration: InputDecoration(
//                       labelText: 'Contents',
//                       hintText: 'Enter contents here',
//                     ),
//                     maxLength: 200,
//                     maxLines: 14,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   _imageGallery(),
//                   ElevatedButton(
//                     onPressed: _savePost,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xff05D686),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: Text(
//                       widget.postId.isEmpty ? "Create Post" : "Update Post",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/bloc/post_screen/post_screen_bloc.dart';
import '../../data/bloc/post_screen/post_screen_event.dart';
import '../../data/bloc/post_screen/post_screen_state.dart';
import '../../service/firebase_storage_service.dart';
import 'my_post_title.dart';
import 'my_post_user.dart';

class PostUpdateScreen extends StatefulWidget {
  String postId;

  // String uid;

  PostUpdateScreen({
    super.key,
    required this.postId,
    // required this.uid,
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

  void _updatePost() {
    String updateTitle = _textControllerTitle.text;
    String updateContent = _textControllerContent.text;


    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('글 수정이 완료되었습니다.')));
    Navigator.pop(context);
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
              onPressed: _updatePost,
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
                selectedImages =
                    post.imageUrls.map((url) => File(url)).toList();
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
                        TextField(
                          controller: _textControllerTitle,
                          maxLength: 30,
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
                                  width: double.infinity,
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: IconButton(
                                    onPressed: () => _removeImage(index),
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
                          maxLines: 15,
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
