// import 'package:flutter/material.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const SizedBox(height: 50),
//               const Text(
//                 'LOGIN',
//                 style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 50),
//               _buildTextField('아이디'),
//               const SizedBox(height: 16),
//               _buildTextField('비밀번호', isPassword: true),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Checkbox(
//                     value: false,
//                     onChanged: (value) {},
//                   ),
//                   const Text(
//                     '로그인 상태 유지',
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   backgroundColor: Colors.black,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   'LOGIN',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(onPressed: () {}, child: const Text('회원가입')),
//                   const Text(' | '),
//                   TextButton(onPressed: () {}, child: const Text('아이디 찾기')),
//                   const Text(' | '),
//                   TextButton(onPressed: () {}, child: const Text('비밀번호 찾기')),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 '또는',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.grey),
//               ),
//               const SizedBox(height: 20),
//               _buildSocialLoginButton(
//                 onPressed: () {},
//                 text: 'Google로 회원가입',
//                 icon: Icons.g_mobiledata,
//                 color: Colors.red,
//               ),
//               const SizedBox(height: 16),
//               _buildSocialLoginButton(
//                 onPressed: () {},
//                 text: 'Apple로 회원가입',
//                 icon: Icons.apple,
//                 color: Colors.black,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String hint, {bool isPassword = false}) {
//     return TextField(
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         hintText: hint,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//       ),
//     );
//   }
//
//   Widget _buildSocialLoginButton({
//     required VoidCallback onPressed,
//     required String text,
//     required IconData icon,
//     required Color color,
//   }) {
//     return ElevatedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon, color: Colors.white),
//       label: Text(text),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         foregroundColor: Colors.white,
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }
// }

// 회원 가입 창