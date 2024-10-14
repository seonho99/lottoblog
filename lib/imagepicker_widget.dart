import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagepickerWidget extends StatefulWidget {
  const ImagepickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagepickerWidget> createState() => _ImagepickerWidgetState();
}

class _ImagepickerWidgetState extends State<ImagepickerWidget> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile?> _pickedImages = [];

  // 카메라, 갤러리에서 이미지 1개 불러오기
  // ImageSource.galley , ImageSource.camera
  void getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    setState(() {
      _pickedImages.add(image);
    });
  }

  // 이미지 여러개 불러오기
  void getMultiImage() async {
    final List<XFile>? images = await _picker.pickMultiImage();

    if (images != null) {
      setState(() {
        _pickedImages.addAll(images);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              _imageLoadButtons(),
              const SizedBox(height: 20),
              _gridPhoto(),
            ],
          ),
        ),
      ),
    );
  }

  // 화면 상단 버튼
  Widget _imageLoadButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: ElevatedButton(
              onPressed: () => getImage(ImageSource.camera),
              child: const Text('Camera'),
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            child: ElevatedButton(
              onPressed: () => getImage(ImageSource.gallery),
              child: const Text('Image'),
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            child: ElevatedButton(
              onPressed: () => getMultiImage(),
              child: const Text('Multi Image'),
            ),
          ),
        ],
      ),
    );
  }

  // 불러온 이미지 gridView
  Widget _gridPhoto() {
    return Expanded(
      child: _pickedImages.isNotEmpty
          ? GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        children: _pickedImages
            .where((element) => element != null)
            .map((e) => _gridPhotoItem(e!))
            .toList(),
      )
          : const SizedBox(),
    );
  }

  Widget _gridPhotoItem(XFile e) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.file(
              File(e.path),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _pickedImages.remove(e);
                });
              },
              child: const Icon(
                Icons.cancel_rounded,
                color: Colors.black87,
              ),
            ),
          )
        ],
      ),
    );
  }
}

//   XFile? _image;
//   final ImagePicker picker = ImagePicker();
//
//   Future getImage(ImageSource imageSource) async {
//     //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
//     final XFile? pickedFile = await picker.pickImage(source: imageSource);
//     if (pickedFile != null) {
//       setState(() {
//         _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         SizedBox(height: 20, width: double.infinity),
//         _buildPhotoArea(),
//         SizedBox(height: 30),
//         _buildButton(),
//       ],
//     );
//   }
//
//   Widget _buildPhotoArea() {
//     return _image != null
//         ? Container(
//       width: 100,
//       height: 100,
//       child: Image.file(File(_image!.path)), //가져온 이미지를 화면에 띄워주는 코드
//     )
//         : Container(
//       width: 100,
//       height: 100,
//       color: Colors.grey,
//     );
//   }
//
//   Widget _buildButton() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ElevatedButton(
//           onPressed: () {
//             getImage(ImageSource.camera); //getImage 함수를 호출해서 카메라로 찍은 사진 가져오기
//           },
//           child: Text("카메라"),
//         ),
//         SizedBox(width: 30),
//         ElevatedButton(
//           onPressed: () {
//             getImage(ImageSource.gallery); //getImage 함수를 호출해서 갤러리에서 사진 가져오기
//           },
//           child: Text("갤러리"),
//         ),
//       ],
//     );
//   }
// }