// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_const
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/services.dart/analytics_service.dart';
import 'package:fitness/services.dart/remote_config_service.dart';
import 'package:fitness/view/health_and_nutrition.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/view/workout_data.dart';
import 'package:get_storage/get_storage.dart';
import 'package:fitness/all_data/all_workout_data.dart';
import 'package:fitness/view/bottomnav.dart';
import 'package:fitness/view/completed_task.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    _currentScreenAnalytics();
    RemoteConfigService.remoteConfig.fetchAndActivate();
    super.initState();
  }

  var box = GetStorage();
  final user = FirebaseAuth.instance.currentUser;

  // final VoidCallback? onttap;
  boderRaduisShadow() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(232, 186, 187, 187),
          offset: Offset(8, 8),
          blurRadius: 10,
        ),
      ],
    );
  }

  containerShadow() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(232, 204, 204, 204),
          offset: Offset(0, 2),
          blurRadius: 6,
        ),
      ],
    );
  }

  Future _currentScreenAnalytics() async {
    AnalyticsService.analytics.setCurrentScreen(
        screenName: "home_screen", screenClassOverride: "home_screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //---Head Section
              SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .where('email', isEqualTo: user!.email)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text("No data found!");
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        List<QueryDocumentSnapshot<Object?>> fireStoreItems =
                            snapshot.data!.docs;
                        final fName = fireStoreItems[0]['name'].split(" ");
                        return Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    RemoteConfigService.remoteConfig
                                            .getString('greeting_text') +
                                        fName[0],
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const FittedBox(
                                  child: const Text("Let's check your activity",
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ),
                              ],
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNav(index: 3),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  maxRadius: 37,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child:
                                        fireStoreItems[0]['profilePhoto'] != ""
                                            ? CachedNetworkImage(
                                                imageUrl: fireStoreItems[0]
                                                    ['profilePhoto'],
                                                height: 70,
                                                width: 70,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                "images/profile.jpg",
                                                height: 154,
                                                width: 154,
                                                fit: BoxFit.cover,
                                              ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      }
                    },
                  ),
                ),
                //---Upper Body
              ),
              const SizedBox(
                height: 26,
              ),
              Container(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CompletedTask()),
                        );
                      },
                      child: Container(
                        decoration: boderRaduisShadow(),
                        width: MediaQuery.of(context).size.width / 2.4,
                        height: 218,
                        // width: 160,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 14),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 28,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: const FittedBox(
                                      child: Text(
                                        'Finished',
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "12",
                              style: TextStyle(
                                  fontSize: 80, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Completed",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            const Text(
                              "Workouts",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const CompletedTask())),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            Container(
                              decoration: boderRaduisShadow(),
                              height: 100,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 15, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.timelapse,
                                          size: 28,
                                          color:
                                              Color.fromARGB(255, 55, 154, 201),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.26,
                                          child: const FittedBox(
                                            child: Text(
                                              'In progress',
                                              style: TextStyle(
                                                fontSize: 19,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    margin:
                                        const EdgeInsets.only(top: 2, left: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Text(
                                          '2',
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Workouts',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const CompletedTask())),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: boderRaduisShadow(),
                                height: 100,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, left: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.timer,
                                            size: 28,
                                            color: Color.fromARGB(
                                                255, 40, 190, 98),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.26,
                                            child: const FittedBox(
                                              child: const Text(
                                                'Time Spent',
                                                style: const TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 2, left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            '62',
                                            style: TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Minutes',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              //-----Health $ Nutrition-----
              Container(
                height: 314,
                decoration: containerShadow(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HealthAndNutrition()));
                      },
                      child: Image.asset(
                        "images/nutrition&health.jpg",
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, left: 15),
                      child: FittedBox(
                        child: Text(
                          "NUTRITION & HEALTH",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: FittedBox(
                          child: Text("Maximize your training results.")),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 14, right: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const HealthAndNutrition())));
                            },
                            child: const Text(
                              "CHECK IT OUT",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(60, 35),
                              primary: Colors.teal,
                              onPrimary: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              //-----Daily Fitness Tile-----
              Container(
                height: 320,
                decoration: containerShadow(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 18,
                            bottom: 13,
                          ),
                          child: Text(
                            "FULL BODY FITNESS EXERCISES",
                            style: TextStyle(
                              fontSize: 15.8,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomNav(index: 1),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "DISCOVER",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 260,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: fitnessWorkouts.length,
                        itemBuilder: (context, index) {
                          return FitnessWorkoutTile(
                            image: fitnessWorkouts[index]["image"],
                            title: fitnessWorkouts[index]["title"]
                                .toString()
                                .toUpperCase(),
                            desc: fitnessWorkouts[index]["desc"],
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
            ],
          ),
        ),
      ),
    );
  }
}

class FitnessWorkoutTile extends StatefulWidget {
  final String? image, title, desc;
  const FitnessWorkoutTile({Key? key, this.desc, this.image, this.title})
      : super(key: key);

  @override
  State<FitnessWorkoutTile> createState() => _FitnessWorkoutTileState();
}

class _FitnessWorkoutTileState extends State<FitnessWorkoutTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 2),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WorkoutDataList(
                title: widget.title.toString().toUpperCase(),
                url: widget.image.toString(),
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(232, 186, 187, 187),
                offset: Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: Image.asset(
                  widget.image!,
                  fit: BoxFit.cover,
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 6),
                child: Text(
                  widget.title!,
                  style: const TextStyle(
                    fontSize: 15.8,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 4, right: 16),
                child: Text(
                  widget.desc!,
                  maxLines: 3,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
