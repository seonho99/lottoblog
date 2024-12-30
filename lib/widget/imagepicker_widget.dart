import 'dart:io';
import 'dart:math';

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

  Future<void> pickImageFromGallery() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        selectedImage = File(image.path);
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
            _selectedImage(),
            _imageGallery(),
          ],
        ),
      ),
    );
  }

  Widget _selectedImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Center(
        child: (selectedImage == null) ? Icon(Icons.image_not_supported,color: Colors.white,size: 100)
        : Image.file(selectedImage!,fit: BoxFit.fill),
      ),
    );
  }

  Widget _imageGallery() {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            crossAxisCount: 3),
        itemCount: 30,
        itemBuilder: (context, index) => Container(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ));
  }
}
