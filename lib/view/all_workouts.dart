import 'package:flutter/material.dart';

class AllWorkouts extends StatefulWidget {
  const AllWorkouts({Key? key}) : super(key: key);

  @override
  State<AllWorkouts> createState() => _AllWorkoutsState();
}

class _AllWorkoutsState extends State<AllWorkouts> {
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
          "ALL WORKOUTS",
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
