// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  final String? name, pic, brand, total_quantity, price;

  final billPrice, delivery_fee;
  const CheckOut(
      {Key? key,
      this.name,
      this.billPrice,
      this.pic,
      this.brand,
      this.delivery_fee,
      this.total_quantity,
      this.price})
      : super(key: key);

  @override
  State<CheckOut> createState() => _BuyNowState();
}

class _BuyNowState extends State<CheckOut> {
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          title: const Text(
            "CHECKOUT",
            style: TextStyle(
                fontSize: 15.8,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: containerShadow(),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.pic.toString(),
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        Text(widget.name.toString()),
                        Text(widget.brand.toString())
                      ],
                    )
                  ],
                ),
              ),
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
                            "${widget.price}",
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
                          left: 15, top: 10, right: 15, bottom: 10),
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
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            child: Text(
                              widget.total_quantity.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
                            "Rs. ${widget.billPrice} ",
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
                            widget.delivery_fee.toString(),
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
                            "Rs. ${widget.billPrice + widget.delivery_fee}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: containerShadow(),
                  child: Column(
                    children: const [
                      Text("Select Payment Methods"),
                    ],
                  )),
            ],
          ),
        ));
  }
}
