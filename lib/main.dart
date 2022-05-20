import 'package:fitness/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyFitness());
}

class MyFitness extends StatelessWidget {
  const MyFitness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mero Fitness',
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
