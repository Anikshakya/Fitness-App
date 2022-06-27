// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fitness/all_data/all_workout_data.dart';
import 'package:flutter/material.dart';

class Category1 extends StatefulWidget {
  final name;
  const Category1({
    Key? key,
    this.name,
  }) : super(key: key);

  @override
  State<Category1> createState() => _Category1State();
}

class _Category1State extends State<Category1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
            child: Text(
              widget.name,
              style:
                  const TextStyle(fontSize: 15.8, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dummy.length,
              itemBuilder: (context, index) {
                var _dummy = dummy[index];
                return CategoryDataListTile(
                  image: _dummy["image"],
                  name: _dummy["name"],
                );
              },
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dummy.length,
              itemBuilder: (context, index) {
                var _dummy = dummy[index];
                return CategoryDataListTile(
                  image: _dummy["image"],
                  name: _dummy["name"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryDataListTile extends StatefulWidget {
  final name, image;
  const CategoryDataListTile({
    Key? key,
    this.name,
    this.image,
  }) : super(key: key);

  @override
  State<CategoryDataListTile> createState() => _CategoryDataListTileState();
}

class _CategoryDataListTileState extends State<CategoryDataListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              widget.image,
              height: 80,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(widget.name),
        ],
      ),
    );
  }
}
