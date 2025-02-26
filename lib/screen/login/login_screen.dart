import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo/lottoblog_300_300.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.go('/login/email_login');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mail,
                          size: 20,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Email 로그인',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // GestureDetector(
                //   onTap: () {
                //     context.go('');
                //   },
                //   child: Container(
                //     width: double.infinity, // 전체 너비 차지
                //     height: 55,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all(width: 1, color: Colors.grey),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Container(
                //           width: 20,
                //           height: 20,
                //           child: Image(
                //             image: AssetImage('assets/logo/google_logo.png'),
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //         SizedBox(
                //           width: 16,
                //         ),
                //         Text(
                //           'Google 로그인',
                //           style: Theme.of(context).textTheme.titleMedium,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 16,
                // ),

                // GestureDetector(
                //   onTap: () {
                //     context.go('');
                //   },
                //   child: Container(
                //     width: double.infinity, // 전체 너비 차지
                //     height: 55,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10),
                //       border: Border.all(width: 1, color: Colors.grey),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Icon(
                //           Icons.apple,
                //           color: Colors.black,
                //         ),
                //         SizedBox(
                //           width: 16,
                //         ),
                //         Text(
                //           'Apple 로그인',
                //           style: Theme.of(context).textTheme.titleMedium,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
