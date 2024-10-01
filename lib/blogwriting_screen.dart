import 'package:flutter/material.dart';

class BlogWritingScreen extends StatelessWidget {
  const BlogWritingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('글 작성', style: Theme.of(context).textTheme.headlineSmall),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '제목',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '제목 30글자',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade300),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_photo_alternate,
                            size: 50, color: Colors.grey),
                        SizedBox(height: 10),
                        Text(
                          '사진/이미지를 추가해주세요.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Container(
              //   height: 50,
              //   decoration: BoxDecoration(
              //     border: Border.all(width: 1,color: Colors.grey.shade300),
              //   ),
              //   child: Container(
              //     padding: EdgeInsets.only(left: 10,right: 10),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Container(
              //           width: 35,
              //           height: 35,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             border: Border.all(width: 1,color: Colors.grey),
              //           ),
              //            child: Center(child: Text('1',style: Theme.of(context).textTheme.headlineSmall)),
              //         ),
              //         Container(
              //           width: 35,
              //           height: 35,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             border: Border.all(width: 1,color: Colors.grey),
              //           ),
              //           child: Center(child: Text('2',style: Theme.of(context).textTheme.headlineSmall)),
              //         ),
              //         Container(
              //           width: 35,
              //           height: 35,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             border: Border.all(width: 1,color: Colors.grey),
              //           ),
              //           child: Center(child: Text('3',style: Theme.of(context).textTheme.headlineSmall)),
              //         ),
              //         Container(
              //           width: 35,
              //           height: 35,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             border: Border.all(width: 1,color: Colors.grey),
              //           ),
              //           child: Center(child: Text('4',style: Theme.of(context).textTheme.headlineSmall)),
              //         ),
              //         Container(
              //           width: 35,
              //           height: 35,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             border: Border.all(width: 1,color: Colors.grey),
              //           ),
              //           child: Center(child: Text('5',style: Theme.of(context).textTheme.headlineSmall)),
              //         ),
              //         Container(
              //           width: 35,
              //           height: 35,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             border: Border.all(width: 1,color: Colors.grey),
              //           ),
              //           child: Center(child: Text('6',style: Theme.of(context).textTheme.headlineSmall)),
              //         ),
              //         Icon(Icons.add,size: 35,color: Colors.grey),
              //         Container(
              //           width: 35,
              //           height: 35,
              //           decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             border: Border.all(width: 1,color: Colors.grey),
              //           ),
              //           child: Center(child: Text('7',style: Theme.of(context).textTheme.headlineSmall)),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: 20),
              Container(
                height: 190,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '글을 작성해주세요.',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    style: TextStyle(fontSize: 20),
                    maxLines: null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {

                    },
                    child:
                        Text('등록', style: Theme.of(context).textTheme.titleLarge),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade100),
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
