import 'package:flutter/material.dart';

class PersonalizedPage extends StatelessWidget {
  const PersonalizedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    '닉네임',
                    style: TextStyle(
                        fontSize: 27,),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 20),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.9,
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        border:Border.all(width: 1,
                        color: Colors.grey),
                      ),
                    child: Text('프로필 수정',style: TextStyle(fontSize: 23,
                    fontWeight: FontWeight.bold),),
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
