import 'package:fitness/view/fitness_centers.dart';
import 'package:fitness/view/shop_home.dart';
import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code_scanner_rounded,
              color: Colors.black,
            ),
          ),
          title: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 216, 216),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(5),
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Shop / Fitness Ceners",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.location_on_outlined,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Shop",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Fitness Centers",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ShopHome(),
            FitnessCenters(),
          ],
        ),
      ),
    );
  }
}
