import 'package:fitness/all_data/all_workout_data.dart';
import 'package:fitness/services.dart/analytics_service.dart';
import 'package:fitness/view/all_exercises.dart';
import 'package:fitness/view/all_workouts.dart';
import 'package:fitness/view/bookmarks.dart';
import 'package:fitness/view/workout_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Workouts extends StatefulWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  @override
  void initState() {
    _currentScreenAnalytics();
    super.initState();
  }

  containerShadow() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(232, 204, 204, 204),
          offset: Offset(1, 3),
          blurRadius: 5,
        ),
      ],
    );
  }

  //----Analytics----
  Future<void> sendWorkoutAnalytics(String workoutName) async {
    var user = FirebaseAuth.instance.currentUser;
    await AnalyticsService.analytics
        .logEvent(name: "workout_analytics", parameters: {
      "workout_name": workoutName,
      "user_email": user?.email,
      "user_id": user?.uid,
    });
    await AnalyticsService.analytics.logEvent(name: workoutName, parameters: {
      "user_email": user?.email,
      "user_id": user?.uid,
    });
  }

  Future _currentScreenAnalytics() async {
    AnalyticsService.analytics.setCurrentScreen(
        screenName: "workout_screen", screenClassOverride: "workout_screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "WORKOUTS",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.5,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //----Fitness Exercises---
              const SizedBox(
                height: 8,
              ),
              Container(
                // height: 252,
                decoration: containerShadow(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8, top: 14),
                      child: Text(
                        "FITNESS EXERCISES",
                        style: TextStyle(
                          fontSize: 15.6,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: fitnessExercise.length,
                        itemBuilder: (context, index) {
                          return FitnessExerciseTile(
                            pic: fitnessExercise[index]["image"].toString(),
                            name: fitnessExercise[index]["name"]
                                .toString()
                                .toUpperCase(),
                            desc: fitnessExercise[index]["desc"].toString(),
                            ontap: () {
                              sendWorkoutAnalytics(
                                  fitnessExercise[index]["name"].toString());
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => WorkoutDataList(
                                          title: fitnessExercise[index]["name"]
                                              .toString(),
                                          url: fitnessExercise[index]["image"]
                                              .toString(),
                                        )),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              //-----Workouts grid list---
              Container(
                height: 434,
                decoration: containerShadow(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8, top: 13, bottom: 10, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "SPECIFIC WORKOUTS",
                            style: TextStyle(
                              fontSize: 15.8,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            "Choose a Workout",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //----workout list row 1-----
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            sendWorkoutAnalytics("Arms");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WorkoutDataList(
                                    title: "Arms", url: "images/arms.jpg"),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            //--Arms--
                            child: Stack(
                              children: [
                                Container(
                                  height: 120,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      "images/arms.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(83, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 15, top: 75),
                                    child: Text(
                                      "ARM",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //---butts & legs----
                        GestureDetector(
                          onTap: () {
                            sendWorkoutAnalytics("Butt & Legs");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WorkoutDataList(
                                    title: "Butt & Legs",
                                    url: "images/legs&butt.jpg"),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Stack(
                              children: [
                                Container(
                                  height: 120,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      "images/legs&butt.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(83, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 20, top: 75),
                                    child: Text(
                                      "BUTT & LEG",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    //--work out grid list row 2---
                    Row(
                      children: [
                        //----ABS----
                        GestureDetector(
                          onTap: () {
                            sendWorkoutAnalytics("Abs");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WorkoutDataList(
                                    title: "Abs", url: "images/abs.jpg"),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Stack(
                              children: [
                                Container(
                                  height: 120,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      "images/abs.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(83, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 20, top: 75),
                                    child: Text(
                                      "ABS",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //----Chest-----
                        GestureDetector(
                          onTap: () {
                            sendWorkoutAnalytics("Chest");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WorkoutDataList(
                                    title: "Chest", url: "images/chest.jpg"),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Stack(
                              children: [
                                Container(
                                  height: 120,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      "images/chest.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(83, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 15, top: 75),
                                    child: Text(
                                      "CHEST",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    //--workout grid list row 3---
                    Row(
                      children: [
                        //----Shoulders & back-----
                        GestureDetector(
                          onTap: () {
                            sendWorkoutAnalytics("Shoulder & Back");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WorkoutDataList(
                                    title: "Shoulder & Back",
                                    url: "images/shoulder&back.jpg"),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Stack(
                              children: [
                                Container(
                                  height: 120,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      "images/shoulder&back.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  width:
                                      MediaQuery.of(context).size.width / 2.1,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(83, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 15, top: 75),
                                    child: Text(
                                      "SHOULDER & BACK",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: containerShadow(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "DISCOVER ALL EXERCISES & WORKOUTS",
                        style: TextStyle(
                          fontSize: 15.8,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Bookmarks()),
                          );
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.bookmark),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Text("Bookmarks"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Text("worouts"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const AllExercises())),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.bookmark),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Text("All Exercises"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Text("worouts"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const AllWorkouts())),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.bookmark),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Text("All Workouts"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Text("worouts"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              //----Random----
              Container(
                decoration: containerShadow(),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: workoutList.length,
                    itemBuilder: (context, index) {
                      return WorkoutList(
                        img: workoutList[index]["url"].toString(),
                        txt: workoutList[index]["name"].toString(),
                        txt2: workoutList[index]["txt"].toString(),
                        ontap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => WorkoutDataList(
                                    url: workoutList[index]["url"].toString(),
                                    title: workoutList[index]["name"],
                                  )),
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutList extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final img, txt, txt2;
  final VoidCallback? ontap;
  const WorkoutList({Key? key, this.img, this.txt, this.txt2, this.ontap})
      : super(key: key);

  boderRaduisShadow() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: const Color.fromARGB(255, 255, 255, 255),
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(232, 197, 199, 199),
          offset: Offset(5, 5),
          blurRadius: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 130,
        // padding: const EdgeInsets.only(top: 9, bottom: 9, left: 16, right: 16),
        margin: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 5),
        decoration: boderRaduisShadow(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.asset(
                img,
                height: MediaQuery.of(context).size.height,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 130,
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txt,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    txt2,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 199, 197, 197),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  ElevatedButton(
                    onPressed: ontap,
                    child: const Text("Start now"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      onPrimary: Colors.white,
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

class FitnessExerciseTile extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final pic, desc, name;
  final VoidCallback? ontap;
  const FitnessExerciseTile(
      {Key? key, this.pic, this.desc, this.name, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, bottom: 8, top: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0),
                offset: Offset(1, 1),
                blurRadius: 3,
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: Image.asset(
                  pic,
                  width: 280,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: const Color.fromARGB(85, 0, 0, 0),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 8),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 120),
                          child: Text(
                            name,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          desc,
                          maxLines: 3,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 231, 231, 231),
                          ),
                        ),
                        const SizedBox(
                          width: 55,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
