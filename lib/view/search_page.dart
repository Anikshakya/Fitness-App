import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/view/order_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchKey = '';
  final clearSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 216, 216, 216),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: TextField(
                textCapitalization: TextCapitalization.words,
                onChanged: ((value) {
                  setState(() {
                    searchKey = value;
                  });
                }),
                controller: clearSearchController,
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 75, 75, 75),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        clearSearchController.clear();
                      },
                      child: const Icon(
                        Icons.clear,
                        color: Color.fromARGB(255, 136, 136, 136),
                      ),
                    ),
                    hintText: 'Search...',
                    hintStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Icon(
                          Icons.edit_note,
                          color: Color.fromARGB(255, 71, 71, 71),
                          size: 16,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Filter",
                          style: TextStyle(
                              color: Color.fromARGB(255, 71, 71, 71),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(87, 30),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        primary: const Color.fromARGB(255, 255, 255, 255),
                        onPrimary: Colors.black),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Offer",
                      style: TextStyle(
                          color: Color.fromARGB(255, 71, 71, 71),
                          fontWeight: FontWeight.w500),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(87, 30),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        primary: const Color.fromARGB(255, 255, 255, 255),
                        onPrimary: Colors.black),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Delivery",
                      style: TextStyle(
                          color: Color.fromARGB(255, 71, 71, 71),
                          fontWeight: FontWeight.w500),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(87, 30),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        primary: const Color.fromARGB(255, 255, 255, 255),
                        onPrimary: Colors.black),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Service",
                      style: TextStyle(
                          color: Color.fromARGB(255, 71, 71, 71),
                          fontWeight: FontWeight.w500),
                    ),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(87, 30),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        primary: const Color.fromARGB(255, 255, 255, 255),
                        onPrimary: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder<QuerySnapshot>(
                  stream: (searchKey != "")
                      ? FirebaseFirestore.instance
                          .collection('shopItems')
                          .where("item_name", isGreaterThanOrEqualTo: searchKey)
                          .where("item_name", isLessThan: searchKey + 'z')
                          .snapshots()
                      : FirebaseFirestore.instance
                          .collection("shopItems")
                          .snapshots(),
                  builder: (context, snapshot) {
                    return (snapshot.connectionState == ConnectionState.waiting)
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot firestoreShopItems =
                                  snapshot.data!.docs[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OrderPage(
                                        price: firestoreShopItems['price'],
                                        brand: firestoreShopItems['brand'],
                                        delivery_fee:
                                            firestoreShopItems['delivery_fee'],
                                        name: firestoreShopItems['item_name'],
                                        pic: firestoreShopItems['image'],
                                        ratings: firestoreShopItems['ratings'],
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      CachedNetworkImage(
                                        imageUrl: firestoreShopItems['image'],
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            firestoreShopItems['item_name'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            firestoreShopItems['brand'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Color.fromARGB(
                                                    255, 255, 209, 59),
                                                size: 18,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  firestoreShopItems['ratings'],
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.teal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ));
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
                    fit: BoxFit.contain,
                    height: 150,
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
                const SizedBox(
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
                      widget.ratings!,
                      style: const TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.price!,
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
        ],
      ),
    );
  }
}
