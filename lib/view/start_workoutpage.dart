// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StartWorkout extends StatefulWidget {
  final workoutName;
  final vid;
  const StartWorkout({Key? key, this.workoutName, this.vid}) : super(key: key);

  @override
  State<StartWorkout> createState() => _WorkoutItemDetailState();
}

class _WorkoutItemDetailState extends State<StartWorkout> {
  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _videoController = VideoPlayerController.asset(widget.vid);
    _initializeVideoPlayerFuture = _videoController.initialize();
    _videoController.play();
    _videoController.setLooping(true);
    _videoController.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(widget.workoutName),
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: VideoPlayer(_videoController),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // shape: BorderRadius.circular(20),
                primary: Colors.white,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
