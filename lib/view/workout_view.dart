// ignore_for_file: avoid_unnecessary_containers
import 'package:fitness/all_data/yoga_data.dart';
import 'package:fitness/view/workout_item_details.dart';
import 'package:flutter/material.dart';

class WorkoutView extends StatefulWidget {
  final String? title;
  final String url;
  const WorkoutView({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  State<WorkoutView> createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 145, 177, 174),
            iconTheme: const IconThemeData(color: Colors.black),
            expandedHeight: 300,
            // floating: true,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 2),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: const Color.fromARGB(255, 223, 240, 231),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.title.toString().toUpperCase(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
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
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Text(
                            widget.title.toString(),
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          // height: MediaQuery.of(context).size.height / 1.3,
                          padding: const EdgeInsets.all(1),
                          child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: yogaList.length,
                              itemBuilder: (context, index) {
                                if (yogaList[index]["type"] == widget.title) {
                                  return YogaListTile(
                                    img: yogaList[index]["url"].toString(),
                                    txt: yogaList[index]["name"].toString(),
                                    txt2: yogaList[index]["txt"].toString(),
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

class YogaListTile extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final img, txt, txt2;
  const YogaListTile({Key? key, this.img, this.txt, this.txt2})
      : super(key: key);
  boderRaduisShadow() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(9),
      color: const Color.fromARGB(255, 241, 245, 243),
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(232, 197, 199, 199),
          offset: Offset(1, 1),
          blurRadius: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 9, bottom: 9, left: 16, right: 16),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: boderRaduisShadow(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Container(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Container(
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WorkoutItemDetail(workoutName: txt),
                          ),
                        );
                      },
                      child: const Text("Let's Start"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        onPrimary: Colors.white,
                        alignment: Alignment.center,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    )
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              child: Image.asset(
                img,
                height: 120,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
