import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagepickerWidget extends StatefulWidget {
  const ImagepickerWidget({super.key});

  @override
  State<ImagepickerWidget> createState() => _ImagepickerWidgetState();
}

class _ImagepickerWidgetState extends State<ImagepickerWidget> {
  List<XFile>? _images = [];
  final ImagePicker picker = ImagePicker();

  Future<void> getImages(ImageSource imageSource) async {
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      setState(() {
        _images!.addAll(pickedFiles);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images!.removeAt(index);
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
    return _images != null && _images!.isNotEmpty
        ? Container(
            height: 300,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: _images!.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.file(
                      File(_images![index].path),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeImage(index),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        : Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            padding: EdgeInsets.all(20),
            child: Icon(Icons.camera_alt, color: Colors.white, size: 50),
          );
  }

  Widget _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            getImages(ImageSource.gallery);
          },
          child: Text('사진/이미지', style: Theme.of(context).textTheme.titleSmall),
        ),
      ],
    );
  }
}
