import 'package:fitness/view/fitness_centers_details.dart';
import 'package:flutter/material.dart';
import '../all_data/shop_data.dart';

class FitnessCenters extends StatefulWidget {
  const FitnessCenters({Key? key}) : super(key: key);

  @override
  State<FitnessCenters> createState() => _FitnessCentersState();
}

class _FitnessCentersState extends State<FitnessCenters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-----two selection tiles---
            Container(
              margin: const EdgeInsets.only(top: 8),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FitnessCenterDetails(),
                        ),
                      );
                    },
                    child: Column(
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
                        SizedBox(
                          height: 274,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: equipmentStores.length,
                            itemBuilder: (context, index) {
                              return EquipmentStoreListTile(
                                pic: equipmentStores[index]["image"],
                                name: equipmentStores[index]["name"]
                                    .toString()
                                    .toUpperCase(),
                                location: equipmentStores[index]["location"]
                                    .toString(),
                                ratings: equipmentStores[index]["ratings"]
                                    .toString(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //-----Workout Centers-----
            Container(
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FitnessCenterDetails(),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 10, top: 15, bottom: 15),
                          child: Text(
                            "Workout Centers",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        SizedBox(
                          height: 270,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: workoutCenters.length,
                            itemBuilder: (context, index) {
                              return FitnessCenterListTile(
                                pic: workoutCenters[index]["image"],
                                name: workoutCenters[index]["name"]
                                    .toString()
                                    .toUpperCase(),
                                location: workoutCenters[index]["location"]
                                    .toString(),
                                ratings:
                                    workoutCenters[index]["ratings"].toString(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FitnessCenterListTile extends StatefulWidget {
  final String? pic, name, location, ratings;
  const FitnessCenterListTile({
    Key? key,
    this.name,
    this.location,
    this.pic,
    this.ratings,
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

    return Container(
      margin: const EdgeInsets.only(left: 20, bottom: 7),
      decoration: boderRaduisShadow(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
            ),
            child: Image.asset(
              widget.pic!,
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
    );
  }
}

class EquipmentStoreListTile extends StatefulWidget {
  final String? pic, name, location, ratings;
  const EquipmentStoreListTile({
    Key? key,
    this.name,
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

    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 7),
      decoration: boderRaduisShadow(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
            ),
            child: Image.asset(
              widget.pic!,
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
    );
  }
}
