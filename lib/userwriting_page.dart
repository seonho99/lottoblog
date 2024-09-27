import 'package:flutter/material.dart';

class UserwritingPage extends StatelessWidget {
  const UserwritingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '제목',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    '제목을 입력하세요.',
                    style: TextStyle(fontSize: 23),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '이미지를 추가해주세요.',
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(height: 15),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey.shade400,
                          child: Icon(
                            Icons.add,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Container(
                      child: CircleAvatar(
                        radius: 20,
                        child: Text(
                          '1',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      child: Text(
                        '2',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      child: Text(
                        '3',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      child: Text(
                        '4',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      child: Text(
                        '5',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      child: Text(
                        '6',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.add,
                    size: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      child: Text(
                        '71',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Text(
                              '글을 작성해주세요.',
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.chevron_left,
                          size: 60,
                          color: Colors.black,
                        ),
                        Text(
                          '이전',
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.grey),
                    alignment: Alignment.center,
                    child: Text(
                      '등록',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class UserwritingPage extends StatefulWidget {
//   const UserwritingPage({Key? key}) : super(key: key);
//
//   @override
//   _UserwritingPageState createState() => _UserwritingPageState();
// }
//
// class _UserwritingPageState extends State<UserwritingPage> {
//   File? _image;
//   final picker = ImagePicker();
//
//   Future getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }
//
//   Widget _buildCircleNumber(int number) {
//     return Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.grey.shade300, width: 1),
//       ),
//       child: CircleAvatar(
//         radius: 20,
//         backgroundColor: Colors.white,
//         child: Text(
//           '$number',
//           style: TextStyle(color: Colors.black, fontSize: 16),
//         ),
//       ),
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('글 작성', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '제목',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 1, color: Colors.grey.shade300),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: '제목을 입력하세요.',
//                       border: InputBorder.none,
//                       hintStyle: TextStyle(color: Colors.grey),
//                     ),
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               GestureDetector(
//                 onTap: getImage,
//                 child: Container(
//                   width: double.infinity,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: Colors.grey.shade300),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: _image == null
//                       ? Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.add_photo_alternate,
//                         size: 50,
//                         color: Colors.grey,
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         '이미지를 추가해주세요.',
//                         style: TextStyle(fontSize: 16, color: Colors.grey),
//                       ),
//                     ],
//                   )
//                       : ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.file(
//                       _image!,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: 200,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     for (int i = 1; i <= 6; i++)
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: _buildCircleNumber(i),
//                       ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Icon(Icons.add, size: 25, color: Colors.grey),
//                     ),
//                     _buildCircleNumber(7),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: Colors.grey.shade300),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: '글을 작성해주세요.',
//                         border: InputBorder.none,
//                         hintStyle: TextStyle(color: Colors.grey),
//                       ),
//                       style: TextStyle(fontSize: 16),
//                       maxLines: null,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TextButton.icon(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(Icons.chevron_left, size: 30, color: Colors.grey),
//                     label: Text(
//                       '이전',
//                       style: TextStyle(fontSize: 16, color: Colors.grey),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle submit action
//                     },
//                     child: Text(
//                       '등록',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue,
//                       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }