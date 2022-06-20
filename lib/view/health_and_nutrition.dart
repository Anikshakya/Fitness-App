import 'package:flutter/material.dart';

class HealthAndNutrition extends StatefulWidget {
  const HealthAndNutrition({Key? key}) : super(key: key);

  @override
  State<HealthAndNutrition> createState() => _HealthAndNutritionState();
}

class _HealthAndNutritionState extends State<HealthAndNutrition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: const Text(
          "HEATLH & NUTRITION",
          style: TextStyle(
              fontSize: 15.8, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: const Center(
        child: Text("comming soon"),
      ),
    );
  }
}
