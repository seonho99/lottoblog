import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/popupmenubotton_widget.dart';

class PostScreen extends StatefulWidget {
  String postId;
  String title;
  String content;
  List<String> imageUrls;

  // DateTime createdAt;

  PostScreen({
    super.key,
    required this.postId,
    required this.title,
    required this.content,
    required this.imageUrls,
    // required this.createdAt,
  });

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder(
              builder: (context,state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 1, color: Colors.grey.shade300),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/profile_dummy/profile_01.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            width: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 12),
                                Text(
                                  '함께 분석해봐요',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '2024 .10 .02',
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        PopupmenubottonWidget(),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1.0,
                    ),
                    SizedBox(height: 30),
                    Text(
                      widget.title,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(height: 1.6, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey.shade300),
                      ),
                      child: ListView.builder(
                          itemCount: widget.imageUrls.length,
                          itemBuilder: (context, index){
                            return Image(image: NetworkImage(widget.imageUrls[index]),
                            fit: BoxFit.cover,);
                          }
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        widget.content,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(height: 1.6),
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
