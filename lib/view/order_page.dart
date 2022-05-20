import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final name, brand, ratings, price, pic;

  const OrderPage(
      {Key? key, this.brand, this.name, this.pic, this.price, this.ratings})
      : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var screenValue = 1;
  var ConvPrice;
  var SplitPrice;
  var billPrice;
  bool _tapValue = true;

  @override
  void initState() {
    ConvPrice = widget.price.split(" ");
    SplitPrice = int.parse(ConvPrice[1]);
    billPrice = SplitPrice;

    super.initState();
  }

  containerShadow() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(232, 186, 187, 187),
          offset: Offset(3, 2),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 230,
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
                          size: 25,
                        )),
                  ),
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Image.asset(
                    widget.pic,
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
                        color: _tapValue ? Colors.white : Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.bookmark_outline,
                            color: _tapValue ? Colors.black : Colors.white,
                            size: 25,
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
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4.3,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(left: 20, top: 14),
                        decoration: containerShadow(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.brand,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19,
                                    color: Colors.grey,
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
                            Text(
                              widget.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
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
                      //----Receipt section----
                      Container(
                        height: MediaQuery.of(context).size.height / 4.2,
                        decoration: containerShadow(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                "RECEIPT",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
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
                                  Spacer(),
                                  //-----Increament & decrement-----
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          increment();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.teal,
                                          onPrimary: Colors.white,
                                          minimumSize: const Size(6, 6),
                                        ),
                                        child: const Text(
                                          "+",
                                          style: TextStyle(
                                            fontSize: 18.2,
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
                                          decrement();
                                        },
                                        child: const Text(
                                          "-",
                                          style: TextStyle(
                                            fontSize: 20,
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
                                children: const [
                                  Text(
                                    "Deliver charge:",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Rs. 100",
                                    style: TextStyle(
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
                                children: const [
                                  Text(
                                    "Total:",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Rs. 100",
                                    style: TextStyle(
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

                      //-----Location
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                top: 10,
                                right: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Deliver To",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.edit,
                                    size: 16,
                                    color: Color.fromARGB(176, 244, 67, 54),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Edit Location",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(176, 244, 67, 54),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 60,
                              height: MediaQuery.of(context).size.height / 11,
                              margin:
                                  const EdgeInsets.only(top: 15, bottom: 25),
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
                                      Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Location, Location",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
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
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
