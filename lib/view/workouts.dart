import 'package:fitness/all_data/workout_data.dart';
import 'package:fitness/view/fitness_centers_details.dart';
import 'package:fitness/view/workout_view.dart';
import 'package:flutter/material.dart';

class Workouts extends StatefulWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  State<Workouts> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
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
              const SizedBox(
                height: 8,
              ),
              //-----Daily Fitness Tile-----
              Container(
                height: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(232, 186, 187, 187),
                      offset: Offset(5, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 18, bottom: 13),
                      child: Text(
                        "DAILY FITNESS WORKOUTS",
                        style: TextStyle(
                          fontSize: 15.8,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
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
                            desc1: fitnessWorkouts[index]["desc1"],
                            desc2: fitnessWorkouts[index]["desc2"],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //----Second tile----
              SizedBox(
                // height: MediaQuery.of(context).size.height - 170.9,
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
                              builder: ((context) => WorkoutView(
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

class FitnessWorkoutTile extends StatefulWidget {
  final String? image, title, desc1, desc2;
  const FitnessWorkoutTile(
      {Key? key, this.desc1, this.desc2, this.image, this.title})
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
              builder: (context) => const FitnessCenterDetails(),
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
                padding: const EdgeInsets.only(left: 16, top: 4),
                child: Text(
                  widget.desc1!,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  widget.desc2!,
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
