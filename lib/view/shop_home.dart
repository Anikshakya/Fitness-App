// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/services.dart/analytics_service.dart';
import 'package:fitness/view/order_page.dart';
import 'package:fitness/widgets/custom_image_refresher.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ShopHome extends StatefulWidget {
  const ShopHome({Key? key}) : super(key: key);

  @override
  State<ShopHome> createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {
  //----analytics----

  Future<void> _currentScreen() async {
    AnalyticsService.analytics.setCurrentScreen(screenName: "ShopingSection");
  }

  @override
  void initState() {
    _currentScreen();
    super.initState();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  onRefresh() async {
    await Future.delayed(const Duration(seconds: 4));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return CustomImageRefresher(
      image: "images/gif/food.gif",
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              //-----Catagories-----
              // padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Equipments"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      // padding: const EdgeInsets.all(20)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Mens"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      // padding: const EdgeInsets.all(20)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Womens"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      // padding: const EdgeInsets.all(20)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Kids"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      // padding: const EdgeInsets.all(20)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //-----first tile-----
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("shopItems")
                  .orderBy("item_name", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text("sd"));
                } else {
                  List<QueryDocumentSnapshot<Object?>> fireStoreValueOffer =
                      snapshot.data!.docs;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Value Offer",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 260,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: fireStoreValueOffer.length,
                          itemBuilder: (context, index) {
                            return ShopTile(
                              pic: fireStoreValueOffer[index]["image"],
                              brandName: fireStoreValueOffer[index]["brand"]
                                  .toString()
                                  .toUpperCase(),
                              itemName: fireStoreValueOffer[index]["item_name"]
                                  .toString(),
                              ratings: fireStoreValueOffer[index]["ratings"]
                                  .toString(),
                              price: fireStoreValueOffer[index]["price"],
                              prevPrice: fireStoreValueOffer[index]
                                  ["prev_price"],
                              ontap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) {
                                      return OrderPage(
                                        brand: fireStoreValueOffer[index]
                                            ["brand"],
                                        name: fireStoreValueOffer[index]
                                            ["item_name"],
                                        pic: fireStoreValueOffer[index]
                                            ["image"],
                                        ratings: fireStoreValueOffer[index]
                                            ["ratings"],
                                        price: fireStoreValueOffer[index]
                                            ["price"],
                                        delivery_fee: fireStoreValueOffer[index]
                                            ["delivery_fee"],
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
            //-----Second  Tile--------
            SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("offers")
                    .orderBy("item_name", descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("No data found....");
                  } else {
                    List<QueryDocumentSnapshot<Object?>> fireStoreShopOffer =
                        snapshot.data!.docs;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "World Cup Offer",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 260,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: fireStoreShopOffer.length,
                            itemBuilder: (context, index) {
                              return Offer2(
                                pic: fireStoreShopOffer[index]["image"],
                                brandName: fireStoreShopOffer[index]["brand"]
                                    .toString()
                                    .toUpperCase(),
                                itemName: fireStoreShopOffer[index]["item_name"]
                                    .toString(),
                                ratings: fireStoreShopOffer[index]["ratings"]
                                    .toString(),
                                price: fireStoreShopOffer[index]["price"],
                                prevPrice: fireStoreShopOffer[index]
                                    ["prev_price"],
                                ontap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) {
                                        return OrderPage(
                                          brand: fireStoreShopOffer[index]
                                              ["brand"],
                                          name: fireStoreShopOffer[index]
                                              ["item_name"],
                                          pic: fireStoreShopOffer[index]
                                              ["image"],
                                          ratings: fireStoreShopOffer[index]
                                              ["ratings"],
                                          price: fireStoreShopOffer[index]
                                              ["price"],
                                          delivery_fee:
                                              fireStoreShopOffer[index]
                                                  ["delivery_fee"],
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
                }),
            //-----third tile-----
            SizedBox(
              height: 30,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("shopItems")
                  .orderBy("item_name", descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text("No data found....");
                } else {
                  List<QueryDocumentSnapshot<Object?>> fireStoreShopItems =
                      snapshot.data!.docs;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "More for You",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: fireStoreShopItems.length,
                          itemBuilder: (context, index) {
                            return VerticalTile(
                              pic: fireStoreShopItems[index]["image"],
                              brandName: fireStoreShopItems[index]["brand"]
                                  .toString()
                                  .toUpperCase(),
                              itemName: fireStoreShopItems[index]["item_name"]
                                  .toString(),
                              ratings: fireStoreShopItems[index]["ratings"]
                                  .toString(),
                              price: fireStoreShopItems[index]["price"],
                              prevPrice: fireStoreShopItems[index]
                                  ["prev_price"],
                              ontap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) {
                                      return OrderPage(
                                        brand: fireStoreShopItems[index]
                                            ["brand"],
                                        name: fireStoreShopItems[index]
                                            ["item_name"],
                                        pic: fireStoreShopItems[index]["image"],
                                        ratings: fireStoreShopItems[index]
                                            ["ratings"],
                                        price: fireStoreShopItems[index]
                                            ["price"],
                                        delivery_fee: fireStoreShopItems[index]
                                            ["delivery_fee"],
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
    );
  }
}

class ShopTile extends StatelessWidget {
  final VoidCallback? ontap;
  final String? pic, brandName, itemName, ratings, price, prevPrice;
  const ShopTile(
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
            Stack(
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
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding:
                      EdgeInsets.only(left: 10, right: 5, top: 4, bottom: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(232, 44, 44, 44),
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Value Offers",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
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
            SizedBox(
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
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 255, 209, 59),
                  size: 18,
                ),
                SizedBox(
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
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Text(
                  price!,
                  style: TextStyle(
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

class Offer2 extends StatefulWidget {
  final VoidCallback? ontap;
  final String? pic, brandName, itemName, ratings, price, prevPrice;
  const Offer2(
      {Key? key,
      this.pic,
      this.ontap,
      this.price,
      this.brandName,
      this.itemName,
      this.ratings,
      this.prevPrice})
      : super(key: key);

  @override
  State<Offer2> createState() => _Offer2State();
}

class _Offer2State extends State<Offer2> {
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
      );
    }

    return GestureDetector(
      onTap: widget.ontap,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: boderRaduisShadow(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: widget.pic!,
                        fit: BoxFit.cover,
                        height: 150,
                        width: 250,
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(
                          left: 10, right: 5, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 231, 162, 57),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(232, 44, 44, 44),
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8)),
                      ),
                      child: Text(
                        "Limited Offers",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 6),
                  child: Text(
                    widget.brandName!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 39, 39, 39),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    widget.itemName!,
                    style: const TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 209, 59),
                      size: 18,
                    ),
                    SizedBox(
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
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.price!,
                      style: TextStyle(
                        color: Color.fromARGB(255, 104, 104, 104),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        widget.prevPrice!,
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
          Container(
            margin: EdgeInsets.only(top: 140, left: 141),
            padding: EdgeInsets.only(left: 10, right: 5, top: 4, bottom: 4),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 224, 224, 224),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(232, 44, 44, 44),
                  offset: Offset(0, 1),
                  blurRadius: 2,
                ),
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
            ),
            child: Text(
              "Up to 30% Discount",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VerticalTile extends StatefulWidget {
  final VoidCallback? ontap;
  final String? pic, brandName, itemName, ratings, price, prevPrice;
  const VerticalTile({
    Key? key,
    this.pic,
    this.price,
    this.brandName,
    this.itemName,
    this.ratings,
    this.prevPrice,
    this.ontap,
  }) : super(key: key);

  @override
  State<VerticalTile> createState() => _VerticalTileState();
}

class _VerticalTileState extends State<VerticalTile> {
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
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(232, 186, 187, 187),
            offset: Offset(2, 5),
            blurRadius: 8,
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: widget.ontap,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 16,
            ),
            decoration: boderRaduisShadow(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.pic!,
                    fit: BoxFit.cover,
                    height: 240,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 6),
                  child: Text(
                    widget.brandName!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 39, 39, 39),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    widget.itemName!,
                    style: const TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 209, 59),
                      size: 18,
                    ),
                    SizedBox(
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
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.price!,
                        style: TextStyle(
                          color: Color.fromARGB(255, 104, 104, 104),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          widget.prevPrice!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 280, left: 252),
            child: ElevatedButton(
              onPressed: widget.ontap,
              child: const Text("Order Now"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, left: 15, right: 15)),
            ),
          ),
        ],
      ),
    );
  }
}
