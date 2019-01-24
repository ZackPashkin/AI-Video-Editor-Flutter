// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mingup/screen/login_screen.dart';

// // This is the Splash Screen
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

//   AnimationController _animationController;
//   Animation<double> _animation;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _animationController = new AnimationController(
//         vsync: this,
//         duration: new Duration(milliseconds: 500)
//     );
//     _animation = new CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeOut,
//     );

//     _animation.addListener(()=> this.setState((){}));
//     _animationController.forward();

//     Timer(Duration(seconds: 10), (){
//       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Container(
//             child: Image.asset(
//               'images/splashscreenbg.png',
//               fit: BoxFit.cover,
//             )
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       FlutterLogo(
//                         size: _animation.value * 100.0,
//                       ),
//                       Padding(padding: EdgeInsets.only(top: 10.0)),
//                       Text("MingUp", style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),)
//                     ],
//                   ),
//                 ),
//               ),
//             ]
//           )
//         ],
//       ),
//     );
//   }
// }