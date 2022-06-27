// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import "dart:math";

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation_radius_in;
  Animation<double>? animation_radius_out;

  final double initialRadius = 12.0;
  double radius = 10.0;

  bool animStatus = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    animation_radius_in = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animation_radius_out = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller!,
        curve: const Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller!.forward();

    controller!.addListener(() {
      setState(() {
        if (controller!.value >= 0.75 && controller!.value <= 1.0) {
          radius = animation_radius_in!.value * initialRadius;
        } else if (controller!.value >= 0.0 && controller!.value <= 0.25) {
          radius = animation_radius_out!.value * initialRadius;
        }
      });
    });

    controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          animStatus = true;
        });
      }
      // else if (status == AnimationStatus.completed) {
      //   setState(() {
      //     animStatus = false;
      //     // controller!.forward();
      //   });
      // }
    });
    controller!.forward();

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
      height: 100.0,
      width: 100.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: animStatus == false
            ? AnimatedBuilder(
                animation: controller!.view,
                builder: (context, child) {
                  return const SpinKitThreeBounce(
                    size: 20,
                    color: Colors.orangeAccent,
                  );
                  // Transform.rotate(
                  //   angle: controller!.value * 2 * pi,
                  //   child: child,
                  // );
                },
                child: Stack(
                  children: [
                    // const Dot(
                    //   color: Colors.black12,
                    //   radius: 10.0,
                    // ),
                    Transform.translate(
                      offset: Offset(radius * cos(pi), radius * sin(pi)),
                      child: const Dot(
                        color: Colors.orangeAccent,
                        radius: 5.0,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                          radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                      child: const Dot(
                        color: Colors.orangeAccent,
                        radius: 5.0,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                          radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                      child: const Dot(
                        color: Colors.orangeAccent,
                        radius: 5.0,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                          radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                      child: const Dot(
                        color: Colors.orangeAccent,
                        radius: 5.0,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                          radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                      child: const Dot(
                        color: Colors.orangeAccent,
                        radius: 5.0,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                          radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                      child: const Dot(
                        color: Colors.orangeAccent,
                        radius: 5.0,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                          radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                      child: const Dot(
                        color: Colors.orangeAccent,
                        radius: 5.0,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                          radius * cos(9 * pi / 4), radius * sin(9 * pi / 4)),
                      child: const Dot(
                        color: Colors.orangeAccent,
                        radius: 5.0,
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: SizedBox(
                  height: 100,
                  width: 80,
                  child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.card_giftcard_outlined,
                            color: Colors.orange,
                          ),
                          Text(
                            "Daraz",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      )),
                ),
              ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double? radius;
  final Color? color;
  const Dot({Key? key, this.radius, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
