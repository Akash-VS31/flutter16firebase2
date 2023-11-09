import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/physics.dart';


class PhysicsAnimation extends StatefulWidget {
  _PhysicsAnimation createState() => _PhysicsAnimation();
}

class _PhysicsAnimation extends State<PhysicsAnimation>
    with SingleTickerProviderStateMixin{
  AnimationController? controller;

  SpringSimulation? simulation;

  @override
  void initState() {
    super.initState();

    simulation = SpringSimulation(
      SpringDescription(
        mass: 1,
        stiffness: 100,
        damping: 1,
      ),
      0.0, // starting point
      300.0, // ending point
      10, // velocity
    );

    controller =
    AnimationController(vsync: this, upperBound: 500, )
      ..addListener(() {
        print(controller!.value);
        setState(() {});
      });

    controller!.animateWith(simulation!);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
          children: [
            Positioned(
              left: 50,
              top: controller!.value,
              height: 10,
              width: 10,
              child: Container(
                color: Colors.redAccent,
              ),
            ),
          ]
      ),
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}