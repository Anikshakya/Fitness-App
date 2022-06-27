// ignore_for_file: prefer_const_constructors

import 'package:fitness/widgets/custom_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
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
          "BOOKMARKS",
          style: TextStyle(
              fontSize: 15.8, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: CustomRefreshWidget(
        widget: const Padding(
          padding: EdgeInsets.only(top: 40),
          child: SpinKitThreeBounce(
            size: 25,
            color: Colors.orangeAccent,
          ),
        ),
        onRefresh: () {
          return Future.delayed(Duration(seconds: 4));
        },
        child: const Center(
          child: Text("Hello"),
        ),
      ),
    );
  }
}
