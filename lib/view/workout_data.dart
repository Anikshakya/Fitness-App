// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:fitness/all_data/all_workout_data.dart';
import 'package:fitness/view/start_workoutpage.dart';
import 'package:flutter/material.dart';

class WorkoutDataList extends StatefulWidget {
  final String? title;
  final String url;
  const WorkoutDataList({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  State<WorkoutDataList> createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutDataList> {
  bool _tapValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              widget.title.toString().toUpperCase() + " WORKOUTS",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
            backgroundColor: Colors.white,
            expandedHeight: 200,
            floating: true,
            pinned: true,
            leading: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 20,
                        )),
                  ),
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.asset(
                    widget.url,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: const Color.fromARGB(117, 0, 0, 0),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _tapValue = !_tapValue;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: _tapValue
                            ? Colors.white
                            : Color.fromARGB(179, 0, 0, 0),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          _tapValue ? Icons.bookmark_outline : Icons.bookmark,
                          color: _tapValue
                              ? Color.fromARGB(150, 0, 0, 0)
                              : Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const Icon(Icons.drag_handle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: Text(
                            widget.title.toString().toUpperCase() + " WORKOUTS",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(1),
                          child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: allWorkoutData.length,
                              itemBuilder: (context, index) {
                                if (allWorkoutData[index]["type"] ==
                                    widget.title) {
                                  return WorkoutDataTile(
                                    img:
                                        allWorkoutData[index]["url"].toString(),
                                    name: allWorkoutData[index]["name"]
                                        .toString()
                                        .toUpperCase(),
                                    time_count: allWorkoutData[index]
                                            ["time_count"]
                                        .toString(),
                                    vid: allWorkoutData[index]["vidUrl"]
                                        .toString(),
                                    description: allWorkoutData[index]
                                            ["description"]
                                        .toString(),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              }),
                        ),
                      ],
                    ),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutDataTile extends StatelessWidget {
  final img, name, time_count, vid, description;
  const WorkoutDataTile(
      {Key? key,
      this.img,
      this.name,
      this.time_count,
      this.vid,
      this.description})
      : super(key: key);
  boderRaduisShadow() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(232, 233, 233, 233),
          offset: Offset(1, 1),
          blurRadius: 5,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    img,
                    height: MediaQuery.of(context).size.height / 4.5,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 4),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        name,
                        maxLines: 2,
                        style: const TextStyle(
                            height: 1,
                            fontSize: 17,
                            color: Color.fromARGB(255, 58, 58, 58),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(description),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Back",
                            style: TextStyle(color: Colors.teal),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        decoration: boderRaduisShadow(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
              child: Container(
                child: Image.asset(
                  img,
                  height: 110,
                  width: MediaQuery.of(context).size.width / 2.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 25, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      name,
                      maxLines: 2,
                      style: const TextStyle(
                          height: 1,
                          fontSize: 15,
                          color: Color.fromARGB(255, 58, 58, 58),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    time_count,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 172, 172, 172),
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StartWorkout(
                            workoutName: name,
                            vid: vid,
                          ),
                        ),
                      );
                    },
                    child: const Text("Let's Start"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      alignment: Alignment.center,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
