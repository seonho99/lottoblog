import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagepickerWidget extends StatefulWidget {
  const ImagepickerWidget({super.key});

  @override
  State<ImagepickerWidget> createState() => _ImagepickerWidgetState();
}

class _ImagepickerWidgetState extends State<ImagepickerWidget> {
  ImagePicker picker = ImagePicker();
  File? selectedImage;
  List<File> selectedImages = [];

  Future<void> pickImageFromGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        selectedImages.add(selectedImage!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.check)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // _selectedImage(),
            _imageGallery()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImageFromGallery,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _selectedImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Center(
        child: (selectedImage == null)
            ? Icon(Icons.image_not_supported, color: Colors.white, size: 100)
            : Image.file(selectedImage!, fit: BoxFit.fill),
      ),
    );
  }

  Widget _imageGallery() {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 1.0, crossAxisSpacing: 1.0, crossAxisCount: 3),
        itemCount: selectedImages.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.black,
            child: Image.file(
              selectedImages[index],
              fit: BoxFit.cover,
            ),
          );
        });
  }
}
