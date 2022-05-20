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

  @override
  void initState() {
    ConvPrice = widget.price.split(" ");
    SplitPrice = int.parse(ConvPrice[1]);
    billPrice = SplitPrice;
    super.initState();
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
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Available seats'),
              ),
            ),
          ],
        ),

        // child: Container(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Image.asset(
        //         widget.pic,
        //         height: 260,
        //         width: MediaQuery.of(context).size.width,
        //         fit: BoxFit.cover,
        //       ),
        //       Text(widget.brand),
        //       Text(widget.name),
        //       Text(widget.ratings),
        //       Text(widget.price),
        //       Text("bill: " + billPrice.toString()),
        //       //-----Increament & decrement-----
        //       Container(
        //         child: Row(
        //           children: [
        //             ElevatedButton(
        //               onPressed: () {
        //                 increment();
        //               },
        //               style: ElevatedButton.styleFrom(
        //                 primary: Colors.teal,
        //                 onPrimary: Colors.white,
        //                 minimumSize: const Size(10, 10),
        //               ),
        //               child: const Text(
        //                 "+",
        //                 style: TextStyle(
        //                   fontSize: 25,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.only(left: 15, right: 15),
        //               child: Text(
        //                 "$screenValue",
        //                 style: const TextStyle(
        //                   fontSize: 25,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //               ),
        //             ),
        //             ElevatedButton(
        //               style: ElevatedButton.styleFrom(
        //                 primary: Colors.teal,
        //                 onPrimary: Colors.white,
        //                 minimumSize: const Size(10, 10),
        //               ),
        //               onPressed: () {
        //                 decrement();
        //               },
        //               child: const Text(
        //                 "-",
        //                 style: TextStyle(
        //                   fontSize: 25,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
