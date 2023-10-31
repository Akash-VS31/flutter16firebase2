import 'package:flutter/material.dart';
class Tweenanimation extends StatefulWidget {
  const Tweenanimation({super.key});

  @override
  State<Tweenanimation> createState() => _TweenanimationState();
}

class _TweenanimationState extends State<Tweenanimation>  with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<TextStyle>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 4000,
      ),
    );

    _animation = TextStyleTween(
      begin: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      end: TextStyle(
        fontSize: 40.0,
        color: Colors.red,
        fontWeight: FontWeight.w900,
      ),
    ).animate(_controller!);

    _animation!.addListener(() {
      setState(() {});
    });

    _controller!.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Animations!',
          style: _animation!.value,
        ),
      ),
    );
  }
}