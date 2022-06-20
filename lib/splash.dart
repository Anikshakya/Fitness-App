import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fitness/services.dart/remote_config_service.dart';
import 'package:fitness/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'services.dart/remote_config_service.dart';

class Splash extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  const Splash({
    Key? key,
    required this.analytics,
    required this.observer,
  }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    RemoteConfigService.remoteConfig.fetchAndActivate();
    super.initState();
    navigatetohome();
  }

  navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(
          analytics: widget.analytics,
          observer: widget.observer,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            Image.asset(
              "images/heartbeat.png",
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              jsonDecode(RemoteConfigService.remoteConfig
                  .getString("splash_text"))["text"],
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
                decoration: TextDecoration.none,
                fontStyle: FontStyle.italic,
                color: Color(int.parse(jsonDecode(RemoteConfigService
                    .remoteConfig
                    .getString("splash_text"))["color"])),
              ),
            ),
            Text(
              RemoteConfigService.remoteConfig.getString('text'),
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
                decoration: TextDecoration.none,
                fontStyle: FontStyle.italic,
                color: Color(0xff000000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
