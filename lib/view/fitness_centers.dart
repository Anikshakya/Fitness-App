// ignore_for_file: prefer_const_constructors

import 'package:fitness/animations/spinning_gif.dart';
import 'package:fitness/view/fitness_centers_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/widgets/custom_refresher_widget.dart';
import 'package:flutter/material.dart';

class FitnessCenters extends StatefulWidget {
  const FitnessCenters({Key? key}) : super(key: key);

  @override
  State<FitnessCenters> createState() => _FitnessCentersState();
}

class _FitnessCentersState extends State<FitnessCenters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomRefreshWidget(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 4));
        },
        widget: const SpinningGif(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //-----two selection tiles---
              Container(
                height: 188,
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
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "All Fitness Centers",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Fitness Centers near you",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Stack(
                            children: [
                              Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width / 2.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    "images/equipmentStore.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width / 2.1,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(83, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 15, top: 75),
                                  child: Text(
                                    "Equipment Centers",
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
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Stack(
                            children: [
                              Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width / 2.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    "images/fitnessCenter.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 120,
                                width: MediaQuery.of(context).size.width / 2.1,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(83, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 28, top: 75),
                                  child: Text(
                                    "Workout Centers",
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
                      ],
                    ),
                  ],
                ),
              ),

              //-----Equipment Stores----
              Container(
                width: double.infinity,
                height: 338,
                margin: const EdgeInsets.only(top: 8),
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
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 15, bottom: 15),
                          child: Text(
                            "Equipment Stores",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("equipmentStores")
                              .orderBy("name", descending: false)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Text("No data found....");
                            } else {
                              List<QueryDocumentSnapshot<Object?>>
                                  fireStoreItems = snapshot.data!.docs;
                              return SizedBox(
                                height: 274,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: fireStoreItems.length,
                                  itemBuilder: (context, index) {
                                    return EquipmentStoreListTile(
                                      pic: fireStoreItems[index]["image"],
                                      name: fireStoreItems[index]["name"]
                                          .toString()
                                          .toUpperCase(),
                                      location: fireStoreItems[index]
                                              ["location"]
                                          .toString(),
                                      ratings: fireStoreItems[index]["ratings"]
                                          .toString(),
                                      ontap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FitnessCenterDetails(
                                              pic: fireStoreItems[index]
                                                  ["image"],
                                              name: fireStoreItems[index]
                                                  ["name"],
                                              location: fireStoreItems[index]
                                                  ["location"],
                                              ratings: fireStoreItems[index]
                                                  ["ratings"],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //-----Fitness Centers-----
              Container(
                height: 338,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 8),
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
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 15, bottom: 15),
                          child: Text(
                            "Fitness Center",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("fitnessCenters")
                              .orderBy("name", descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const Text("No data found....");
                            } else {
                              List<QueryDocumentSnapshot<Object?>>
                                  fireStoreItems = snapshot.data!.docs;
                              return SizedBox(
                                height: 274,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: fireStoreItems.length,
                                  itemBuilder: (context, index) {
                                    return FitnessCenterListTile(
                                      pic: fireStoreItems[index]["image"],
                                      name: fireStoreItems[index]["name"]
                                          .toString()
                                          .toUpperCase(),
                                      location: fireStoreItems[index]
                                              ["location"]
                                          .toString(),
                                      ratings: fireStoreItems[index]["ratings"]
                                          .toString(),
                                      ontap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FitnessCenterDetails(
                                              pic: fireStoreItems[index]
                                                  ["image"],
                                              name: fireStoreItems[index]
                                                  ["name"],
                                              location: fireStoreItems[index]
                                                  ["location"],
                                              ratings: fireStoreItems[index]
                                                  ["ratings"],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FitnessCenterListTile extends StatefulWidget {
  final String? pic, name, location, ratings;
  final VoidCallback ontap;
  const FitnessCenterListTile({
    Key? key,
    this.name,
    this.location,
    this.pic,
    this.ratings,
    required this.ontap,
  }) : super(key: key);

  @override
  State<FitnessCenterListTile> createState() => _FitnessCenterListTileState();
}

class _FitnessCenterListTileState extends State<FitnessCenterListTile> {
  @override
  Widget build(BuildContext context) {
    boderRaduisShadow() {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(232, 186, 187, 187),
            offset: Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        margin: const EdgeInsets.only(left: 10, bottom: 7, right: 10),
        decoration: boderRaduisShadow(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.pic!,
                fit: BoxFit.cover,
                height: 160,
                width: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 12),
              child: Text(
                widget.name!,
                style: const TextStyle(
                  color: Color.fromARGB(255, 39, 39, 39),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.teal,
                    size: 15,
                  ),
                  Text(
                    widget.location!,
                    style: const TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 255, 209, 59),
                  size: 18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.ratings!,
                  style: const TextStyle(
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EquipmentStoreListTile extends StatefulWidget {
  final String? pic, name, location, ratings;
  final VoidCallback ontap;
  const EquipmentStoreListTile({
    Key? key,
    this.name,
    required this.ontap,
    this.location,
    this.pic,
    this.ratings,
  }) : super(key: key);

  @override
  State<EquipmentStoreListTile> createState() => _EquipmentStoreListTileState();
}

class _EquipmentStoreListTileState extends State<EquipmentStoreListTile> {
  @override
  Widget build(BuildContext context) {
    boderRaduisShadow() {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(232, 186, 187, 187),
            offset: Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        margin: const EdgeInsets.only(left: 10, bottom: 7, right: 10),
        decoration: boderRaduisShadow(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
              ),
              child: CachedNetworkImage(
                imageUrl: widget.pic!,
                fit: BoxFit.cover,
                height: 160,
                width: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 12),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  widget.name!,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 39, 39, 39),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.teal,
                    size: 15,
                  ),
                  Text(
                    widget.location!,
                    style: const TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 255, 209, 59),
                  size: 18,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.ratings!,
                  style: const TextStyle(
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
