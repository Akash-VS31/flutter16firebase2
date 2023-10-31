import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter16firebase2/animations/tween_animation.dart';
import 'package:flutter16firebase2/email_verification/loginpage.dart';
import 'package:flutter16firebase2/phonenumber_authantication/phone.dart';
// void main() async{
// WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//     home: Tweenanimation(),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(home: Scaffold(body: Center(child: TweenAnimation(),),),);
  }
}

class TweenAnimation extends StatefulWidget
{
  @override
  TweenAnimationState createState() => TweenAnimationState();
}

class TweenAnimationState extends State<TweenAnimation> with SingleTickerProviderStateMixin
{
  AnimationController? controller;
  Animation<double>? sizeAnimation;
  late Animation<Color?> _color;

  @override
  void initState()
  {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this,)..repeat(reverse: true);
    sizeAnimation = Tween<double>(begin: 200, end: 50,).animate(controller!);
// color tween
    _color =
        ColorTween(begin: Colors.purple, end: Colors.red).animate(controller!);  }

  @override
  Widget build(BuildContext context)
  {
    return AnimatedBuilder(animation: controller!,


      builder: (context, child)
    {
      return Container(width: sizeAnimation!.value, height: sizeAnimation!.value, color: _color.value,);
    },);
  }

  @override
  void dispose()
  {
    controller!.dispose();
    super.dispose();
  }
}