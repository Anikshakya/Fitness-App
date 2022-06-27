// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/all_data/all_workout_data.dart';
import 'package:fitness/model/json_data.dart';
import 'package:fitness/model/url_parse.dart';
import 'package:flutter/material.dart';

class Category2 extends StatefulWidget {
  final name;
  const Category2({Key? key, this.name}) : super(key: key);

  @override
  State<Category2> createState() => _Category2State();
}

class _Category2State extends State<Category2> {
  List<PhotoAlbum>? _photoAlbum;
  bool? _loading;

  @override
  void initState() {
    JsonParseService.getData().then((value) {
      setState(() {
        _photoAlbum = value;
        _loading = false;
      });
    });
    super.initState();
  }

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
              height: MediaQuery.of(context).size.height * 0.16,
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
              )),
          const Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          _loading == false && _photoAlbum!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (BuildContext context, _) {
                      return Wrap(
                        children: List.generate(
                          20,
                          (index) => (CategoryNetworkTile(
                            image: _photoAlbum![index].thumbnailUrl,
                            name: _photoAlbum![index].title.toString(),
                          )),
                        ),
                      );
                    },
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
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
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
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

class CategoryNetworkTile extends StatefulWidget {
  final name, image;
  const CategoryNetworkTile({Key? key, this.name, this.image})
      : super(key: key);

  @override
  State<CategoryNetworkTile> createState() => _CategoryNetworkTileState();
}

class _CategoryNetworkTileState extends State<CategoryNetworkTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: widget.image,
              height: 80,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
              width: 50,
              // width: MediaQuery.of(context).size.width * 0.19,
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
