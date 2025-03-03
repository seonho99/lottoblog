// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class PostUpdateScreen extends StatefulWidget {
//   PostUpdateScreen({super.key, required String postId});
//
//   @override
//   State<PostUpdateScreen> createState() => _PostUpdateScreenState();
// }
//
// class _PostUpdateScreenState extends State<PostUpdateScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         scrolledUnderElevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.add_a_photo_outlined, size: 45),
//             ),
//             SizedBox(width: 20),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xff05D686),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Text(
//                 '등록',
//                 style: Theme
//                     .of(context)
//                     .textTheme
//                     .titleMedium
//                     ?.copyWith(
//                     color: Colors.white, fontWeight: FontWeight.w800),
//               ),
//             ),
//           ],
//         ),
//       ),
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller:,
//                 keyboardType: TextInputType.text,
//                 onChanged:,
//                 inputFormatters: [
//                   LengthLimitingTextInputFormatter(),
//                 ],
//                 style: Theme
//                     .of(context)
//                     .textTheme
//                     .headlineLarge,
//                 decoration: InputDecoration(
//                   hintText: '제목',
//                   hintStyle: Theme
//                       .of(context)
//                       .textTheme
//                       .headlineLarge
//                       ?.copyWith(
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w800,
//                   ),
//                   border: InputBorder.none,
//                   floatingLabelBehavior: FloatingLabelBehavior.always
//                 ),
//               ),
//               SizedBox(height: 10,),
//               Divider(color: Colors.black54,),
//               SizedBox(height: 10,),
//               TextFormField(
//                 controller: ,
//                 keyboardType: TextInputType.text,
//                 onChanged: ,
//                 maxLines: null,
//                 inputFormatters: [
//                   LengthLimitingTextInputFormatter(200),
//                 ],
//                 style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                   color: Colors.black,height: 1.6
//                 ),
//                 decoration: InputDecoration(
//                   hintText: '내용을 입력해주세요.',
//                   hintStyle: Theme.of(context).textTheme.titleLarge
//                     ?.copyWith(color: Colors.black54,
//                   fontWeight: FontWeight.w600),
//                   border: InputBorder.none,
//                   floatingLabelBehavior: FloatingLabelBehavior.always
//                 ),
//               ),
//               SizedBox(height: 20,),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
