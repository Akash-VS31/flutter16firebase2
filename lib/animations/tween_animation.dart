import 'package:flutter/material.dart';

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