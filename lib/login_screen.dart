import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),  // 텍스트와 이미지 사이의 간격
                          Text(
                            'Google로 회원가입',
                            style: TextStyle(
                              color: Colors.black,  // 글자 색상 수정 (흰색이 보이지 않음)
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.apple,
                            color: Colors.white,
                          ),
                          Text(
                            'Apple로 회원가입',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
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

// _buildSocialLoginButton(
// onPressed: () {},
// text: 'Google로 회원가입',
// icon: Icons.g_mobiledata,
// color: Colors.red,
// ),
// const SizedBox(height: 16),
// _buildSocialLoginButton(
// onPressed: () {},
// text: 'Apple로 회원가입',
// icon: Icons.apple,
// color: Colors.black,
// ),
