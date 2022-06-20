// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'order_page.dart';

class FitnessCenterDetails extends StatefulWidget {
  final pic, name, location, ratings;
  const FitnessCenterDetails(
      {Key? key, this.pic, this.location, this.name, this.ratings})
      : super(key: key);

  @override
  State<FitnessCenterDetails> createState() => _FitnessCenterDetailsState();
}

class _FitnessCenterDetailsState extends State<FitnessCenterDetails> {
  @override
  void initState() {
    getAddressFromLatLong();
    super.initState();
  }

  bool _tapValue = true;
  var Address;
  var locationMessage;
  // Current location
  Future getAddressFromLatLong() async {
    await Geolocator.requestPermission();
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      locationMessage = "$Address";
    });
    return locationMessage;
  }

  containerShadow() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(232, 204, 204, 204),
          offset: Offset(2, 2),
          blurRadius: 3.5,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 190,
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
                  CachedNetworkImage(
                    imageUrl: widget.pic,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: const Color.fromARGB(52, 0, 0, 0),
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
                            : const Color.fromARGB(179, 0, 0, 0),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.bookmark_outline,
                            color: _tapValue ? Colors.black : Colors.white,
                            size: 20,
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.width * 1.94,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 14,
                          bottom: 15,
                        ),
                        decoration: containerShadow(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    widget.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  "See more",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.teal),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15,
                                    color: Colors.teal,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: Colors.green,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Text(
                                    widget.location,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 16,
                                ),
                                Text(
                                  widget.ratings,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              indent: 10,
                              endIndent: 10,
                            ),
                            const Spacer(),
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(right: 15),
                                padding: const EdgeInsets.all(10),
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(26, 240, 108, 126),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 18,
                                      color: Color.fromARGB(255, 206, 29, 16),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: const Text(
                                        "Use code TAPTAP2022 to get Rs.150 off on orders",
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Color.fromARGB(
                                                255, 206, 29, 16),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
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

                      //-----Second Container
                      Container(
                        padding: const EdgeInsets.only(bottom: 15),
                        decoration: containerShadow(),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                top: 10,
                                right: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "DELIVER TO",
                                    style: TextStyle(
                                      fontSize: 15.8,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.edit,
                                    size: 15,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Edit Location",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 15, bottom: 25, left: 20, right: 20),
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: const Border(
                                    top: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 211, 210, 210)),
                                    left: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 211, 210, 210)),
                                    right: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 211, 210, 210)),
                                    bottom: BorderSide(
                                        width: 1,
                                        color:
                                            Color.fromARGB(255, 211, 210, 210)),
                                  )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        "Current location",
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 114, 114, 114),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: locationMessage == null
                                        ? Center(
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 100,
                                                    top: 8,
                                                    bottom: 4),
                                                child:
                                                    const CircularProgressIndicator()),
                                          )
                                        : Text(
                                            locationMessage.toString(),
                                            maxLines: 2,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection("shopItems")
                                  .orderBy("item_name", descending: false)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  List<QueryDocumentSnapshot<Object?>>
                                      fireStoreItems = snapshot.data!.docs;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, top: 5, bottom: 5),
                                        child: Text(
                                          "Products",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        height: 260,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: fireStoreItems.length,
                                          itemBuilder: (context, index) {
                                            return StoreProduts(
                                              pic: fireStoreItems[index]
                                                  ["image"],
                                              brandName: fireStoreItems[index]
                                                      ["brand"]
                                                  .toString()
                                                  .toUpperCase(),
                                              itemName: fireStoreItems[index]
                                                      ["item_name"]
                                                  .toString(),
                                              ratings: fireStoreItems[index]
                                                      ["ratings"]
                                                  .toString(),
                                              price: fireStoreItems[index]
                                                  ["price"],
                                              prevPrice: fireStoreItems[index]
                                                  ["prev_price"],
                                              ontap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: ((context) {
                                                      return OrderPage(
                                                        brand: fireStoreItems[
                                                            index]["brand"],
                                                        name: fireStoreItems[
                                                            index]["item_name"],
                                                        pic: fireStoreItems[
                                                            index]["image"],
                                                        ratings: fireStoreItems[
                                                            index]["ratings"],
                                                        price: fireStoreItems[
                                                            index]["price"],
                                                        delivery_fee:
                                                            fireStoreItems[
                                                                    index][
                                                                "delivery_fee"],
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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

class StoreProduts extends StatelessWidget {
  final VoidCallback? ontap;
  final String? pic, brandName, itemName, ratings, price, prevPrice;
  const StoreProduts(
      {Key? key,
      this.pic,
      this.price,
      this.brandName,
      this.itemName,
      this.ratings,
      this.prevPrice,
      this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    boderRaduisShadow() {
      return BoxDecoration(
        border: const Border(
          top:
              BorderSide(width: 0.5, color: Color.fromARGB(255, 202, 202, 202)),
          bottom:
              BorderSide(width: 0.5, color: Color.fromARGB(255, 202, 202, 202)),
          left:
              BorderSide(width: 0.5, color: Color.fromARGB(255, 202, 202, 202)),
          right:
              BorderSide(width: 0.5, color: Color.fromARGB(255, 202, 202, 202)),
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        // boxShadow: const [
        //   BoxShadow(
        //     color: Color.fromARGB(232, 186, 187, 187),
        //     offset: Offset(8, 8),
        //     blurRadius: 10,
        //   ),
        // ],
      );
    }

    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: boderRaduisShadow(),
      child: GestureDetector(
        onTap: ontap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: pic!,
                fit: BoxFit.cover,
                height: 150,
                width: 250,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 6),
              child: Text(
                brandName!,
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
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                itemName!,
                style: const TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 8,
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
                  ratings!,
                  style: const TextStyle(
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Text(
                  price!,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 104, 104, 104),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    prevPrice!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                    ),
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
