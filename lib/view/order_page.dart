// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_constructors
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fitness/services.dart/analytics_service.dart';
import 'package:fitness/view/cart.dart';
import 'package:fitness/view/check_out.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderPage extends StatefulWidget {
  var name, brand, ratings, price, pic, delivery_fee;

  OrderPage(
      {Key? key,
      this.brand,
      this.name,
      this.pic,
      @required this.price,
      this.ratings,
      this.delivery_fee})
      : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //----Analytics----
  Future<void> _addToCart() async {
    var user = FirebaseAuth.instance.currentUser;

    var _itemId = FirebaseFirestore.instance.collection("shopItems").doc().id;
    AnalyticsService.analytics
        .logEvent(name: "custom_add_to_cart", parameters: {
      'user_email': user!.email,
      'user_id': user.uid,
      'product_name': widget.name,
      'product_price': widget.price,
      'location': locationMessage,
    });

    widget.name = AnalyticsEventItem(
      affiliation: 'Fitness Ghar',
      coupon: 'AnikIsAwesome',
      discount: 2,
      itemId: _itemId,
      itemBrand: widget.brand,
      itemName: widget.name,
      price: billPrice,
      currency: ConvPrice[0].toString(),
      quantity: screenValue,
    );
    AnalyticsService.analytics.logAddToCart(
      currency: ConvPrice[0],
      items: [widget.name],
    );
  }

  var screenValue = 1;
  var ConvPrice;
  var SplitPrice;
  var billPrice;
  bool _tapValue = true;
  var ConvDeliveryPrice;
  var SplitDeliveryFee;
  var locationMessage = '';
  var Address;

  @override
  void initState() {
    ConvPrice = widget.price.split(". ");
    SplitPrice = int.parse(ConvPrice[1]);
    billPrice = SplitPrice;
    ConvDeliveryPrice = widget.delivery_fee.split(". ");
    SplitDeliveryFee = int.parse(ConvDeliveryPrice[1]);
    getAddressFromLatLong();
    super.initState();
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

  increment() {
    if (screenValue < 10) {
      setState(() {
        screenValue++;
        // billPrice = SplitPrice + billPrice;
        billPrice += SplitPrice;
      });
    } else {
      return screenValue;
    }
  }

  decrement() {
    if (screenValue > 1) {
      setState(() {
        screenValue--;
        billPrice -= SplitPrice;
      });
    } else {
      return screenValue;
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 180,
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
                            _tapValue ? Icons.bookmark_outline : Icons.bookmark,
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
                  height: MediaQuery.of(context).size.height / 1.11,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(left: 20, top: 14),
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
                                    widget.brand,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  "See Reviews",
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                widget.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.ratings,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.price,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 83, 83, 83)),
                            ),
                            const Divider(
                              indent: 10,
                              endIndent: 10,
                            ),
                            const Spacer(),
                            Center(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    bottom: 15, right: 15),
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

                      //-----Location
                      Container(
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
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: locationMessage == ''
                                        ? Center(
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    right: 100,
                                                    top: 8,
                                                    bottom: 4),
                                                child:
                                                    CircularProgressIndicator()),
                                          )
                                        : Text(
                                            locationMessage.toString(),
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      //----Receipt section----
                      Container(
                        height: 196,
                        decoration: containerShadow(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                "RECEIPT",
                                style: TextStyle(
                                  fontSize: 15.8,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            const Divider(
                              indent: 15,
                              endIndent: 15,
                              thickness: 1.5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 10, right: 15),
                              child: Row(
                                children: [
                                  const Text(
                                    "Quantity",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Spacer(),
                                  //-----Increament & decrement-----
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          decrement();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.teal,
                                          onPrimary: Colors.white,
                                          minimumSize: const Size(6, 6),
                                        ),
                                        child: const Text(
                                          "-",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                        ),
                                        child: Text(
                                          "$screenValue",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.teal,
                                          onPrimary: Colors.white,
                                          minimumSize: const Size(6, 6),
                                        ),
                                        onPressed: () {
                                          increment();
                                        },
                                        child: const Text(
                                          "+",
                                          style: TextStyle(
                                            fontSize: 18.2,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    "Sub-Total: ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "Rs. " + billPrice.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 10,
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    "Deliver charge:",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    widget.delivery_fee,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              indent: 25,
                              endIndent: 25,
                              thickness: 0.8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 1,
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    "Total:",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "Rs. ${SplitDeliveryFee + billPrice}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(55, 45),
                              primary: Colors.teal,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              _addToCart();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => Cart()),
                                ),
                              );
                            },
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  'Add to Cart',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(55, 45),
                              primary: Colors.teal,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () => checkOutDataAnalytics().then(
                              (value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckOut(
                                    name: widget.name,
                                    pic: widget.pic,
                                    price: widget.price,
                                    billPrice: billPrice,
                                    brand: widget.brand,
                                    delivery_fee: SplitDeliveryFee,
                                    total_quantity: screenValue.toString(),
                                  ),
                                ),
                              ),
                            ),
                            child: Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.attach_money,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  'Check Out',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                        ],
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

  Future checkOutDataAnalytics() async {
    var user = FirebaseAuth.instance.currentUser;
    // AnalyticsEventItem _item_name = widget.name;
    await AnalyticsService.analytics.logBeginCheckout(
      currency: ConvPrice[0].toString(),
      value: double.parse(billPrice.toString()) +
          double.parse(SplitDeliveryFee.toString()),
      coupon: "FITNESSGHARISAWESOME",
      items: [widget.name as AnalyticsEventItem],
    );
    await AnalyticsService.analytics
        .logEvent(name: 'checkout_begins', parameters: {
      'email': user?.email,
      'item_name': widget.name,
      'currency': ConvPrice[0].toString(),
      'total_price': billPrice + SplitDeliveryFee,
    });
  }
}
