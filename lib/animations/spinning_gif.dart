import 'package:flutter/material.dart';
import 'dart:math';

class SpinningGif extends StatefulWidget {
  const SpinningGif({Key? key}) : super(key: key);

  @override
  State<SpinningGif> createState() => _SpinningGifState();
}

class _SpinningGifState extends State<SpinningGif>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  Animation<double>? opacity;
  AnimationController? controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    opacity = Tween<double>(begin: 0.0, end: 1.0).animate(controller!);

    opacity!.addListener(() {
      setState(() {
        opacity!.value;
      });
    });

    controller!.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: AnimatedBuilder(
          animation: controller!.view,
          builder: ((context, child) {
            return Transform.rotate(
              angle: controller!.value * 2 * pi,
              child: child,
            );
          }),
          child: Opacity(
            opacity: opacity!.value,
            child: Image.asset(
              "images/gif/food.gif",
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
