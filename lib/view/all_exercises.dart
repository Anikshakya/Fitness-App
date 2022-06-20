import 'package:flutter/material.dart';

class AllExercises extends StatefulWidget {
  const AllExercises({Key? key}) : super(key: key);

  @override
  State<AllExercises> createState() => _AllExercisesState();
}

class _AllExercisesState extends State<AllExercises> {
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
          "All EXERCISES",
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
