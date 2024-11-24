import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagepickerWidget extends StatefulWidget {
  const ImagepickerWidget({super.key});

  @override
  State<ImagepickerWidget> createState() => _ImagepickerWidgetState();
}

class _ImagepickerWidgetState extends State<ImagepickerWidget> {
  List<XFile> _images = [];
  final ImagePicker picker = ImagePicker();

  Future<void> getImages(ImageSource imageSource) async {
    if (_images.length < 3) {
      final List<XFile>? pickedFiles = await picker.pickMultiImage();
      if (pickedFiles != null) {
        setState(() {
          _images.addAll(pickedFiles);
          if (_images.length > 3) {
            _images = _images.sublist(0, 3);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('최대 3장까지 선택할 수 있습니다.')),
            );
          }
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('최대 3장까지 선택할 수 있습니다.')),
      );
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30, width: double.infinity),
        _buildPhotoArea(),
        SizedBox(height: 20),
        _buildButton(),
      ],
    );
  }

  Widget _buildPhotoArea() {
    return _images.isNotEmpty
        ? Container(
            height: 100,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: Image.file(
                        File(_images[index].path),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: IconButton(
                        icon: Icon(Icons.delete, color: Colors.grey),
                        onPressed: () => _removeImage(index),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        : Center(child: Text('선택한 이미지가 없습니다.'));
  }

  Widget _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            getImages(ImageSource.gallery);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: Text('사진/이미지', style: Theme.of(context).textTheme.titleSmall),
        ),
      ],
    );
  }
}
