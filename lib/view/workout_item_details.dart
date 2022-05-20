import 'package:flutter/material.dart';

class WorkoutItemDetail extends StatefulWidget {
  final workoutName;
  const WorkoutItemDetail({Key? key, this.workoutName}) : super(key: key);

  @override
  State<WorkoutItemDetail> createState() => _WorkoutItemDetailState();
}

class _WorkoutItemDetailState extends State<WorkoutItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text(widget.workoutName),
        ),
      ),
    );
  }
}
