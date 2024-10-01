import 'package:flutter/material.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Logo',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '닉네임',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '아이디',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '프로필 수정',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Divider(color: Colors.grey, thickness: 1.0),
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '마이 페이지',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 25),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 15),
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      Text(
                                        '내 블로그',
                                        style: TextStyle(fontSize: 23),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 15, bottom: 15),
                                    child: Divider(color: Colors.grey, thickness: 1.0),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 15),
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      Text(
                                        '내 블로그',
                                        style: TextStyle(fontSize: 23),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 15),
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      Text(
                                        '내 블로그',
                                        style: TextStyle(fontSize: 23),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
