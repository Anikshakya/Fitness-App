// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:fitness/all_data/workout_data.dart';
import 'package:fitness/view/bottomnav.dart';
import 'package:fitness/view/completed_task.dart';
import 'package:fitness/view/workout_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var box = GetStorage();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //---Head Section
              SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Hi, Rose',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Let's check your activity",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              )),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const BottomNav(index: 2),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 25),
                          child: CircleAvatar(
                            backgroundColor: Colors.teal,
                            maxRadius: 37,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: box.read("a") != null
                                  ? Image.file(
                                      File(box.read("a")),
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
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 28,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Finished',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
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
                    Container(
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
                                  margin:
                                      const EdgeInsets.only(top: 10, left: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Icon(
                                        Icons.timelapse,
                                        size: 28,
                                        color:
                                            Color.fromARGB(255, 55, 154, 201),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'In progress',
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  margin:
                                      const EdgeInsets.only(top: 2, left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: boderRaduisShadow(),
                            height: 100,
                            // width: 188,
                            child: Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 10, left: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Icon(
                                        Icons.timer,
                                        size: 28,
                                        color: Color.fromARGB(255, 40, 190, 98),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Time Spent',
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 2, left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                        ],
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
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(232, 173, 173, 173),
                      offset: Offset(1, 1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/nutrition&health.jpg",
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, left: 15),
                      child: Text(
                        "NUTRITION & HEALTH",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, left: 15),
                      child: Text("Maximize your training results."),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 14, right: 20),
                          child: ElevatedButton(
                            onPressed: () {},
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

              //----Lower Body---
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 254,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(232, 150, 150, 150),
                      offset: Offset(1, 1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "DISCOVER WORKOUTS",
                            style: TextStyle(
                              fontSize: 15.6,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              "SEE MORE",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: discoverWorkouts.length,
                        itemBuilder: (context, index) {
                          return CardTile(
                            pic: discoverWorkouts[index]["image"].toString(),
                            name: discoverWorkouts[index]["name"]
                                .toString()
                                .toUpperCase(),
                            desc: discoverWorkouts[index]["desc"].toString(),
                            ontap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => WorkoutView(
                                          title: discoverWorkouts[index]["name"]
                                              .toString(),
                                          url: discoverWorkouts[index]["image"]
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
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardTile extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final pic, desc, name;
  final VoidCallback? ontap;
  const CardTile({Key? key, this.pic, this.desc, this.name, this.ontap})
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
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1),
                  child: Image.asset(
                    pic,
                    width: 280,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: const Color.fromARGB(85, 0, 0, 0),
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 130),
                        child: Text(
                          name,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Row(
                          children: [
                            Text(
                              desc,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 211, 211, 211),
                              ),
                            ),
                            const SizedBox(
                              width: 55,
                            ),
                          ],
                        ),
                      ),
                    ],
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
