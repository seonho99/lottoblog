// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'dayofweek_screen.dart';
//
// class DayofweekAnimated extends StatefulWidget {
//   const DayofweekAnimated({super.key});
//
//   @override
//   State<DayofweekAnimated> createState() => _DayofweekAnimatedState();
// }
//
// class _DayofweekAnimatedState extends State<DayofweekAnimated> {
//   final PageController _screenController = PageController();
//   late Timer _timer;
//   int _currentScreen = 0;
//
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
//       _currentScreen++;
//       if (_screenController.hasClients) {
//         _screenController.animateToPage(_currentScreen,
//             duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     _screenController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: PageView.builder(
//         itemBuilder: (context, index) {
//           int loopedIndex = index % _texts.length;
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Flexible(
//                 child: Text(
//                   _texts[loopedIndex][0],
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Flexible(
//                 child: Text(
//                   _texts[loopedIndex][1],
//                   style: TextStyle(fontSize: 15),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
