import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ImagepickerWidget extends StatefulWidget {
  const ImagepickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagepickerWidget> createState() => _ImagepickerWidgetState();
}

class _ImagepickerWidgetState extends State<ImagepickerWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _image == null
            ? const Text('No image selected.')
            : Image.file(_image!),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _getImage,
          child: const Text('Pick Image'),
        ),
      ],
    );
  }
}