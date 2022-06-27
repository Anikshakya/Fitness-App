import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/model/json_data.dart';
import 'package:fitness/model/url_parse.dart';
import 'package:fitness/widgets/custom_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllWorkouts extends StatefulWidget {
  const AllWorkouts({Key? key}) : super(key: key);

  @override
  State<AllWorkouts> createState() => _AllWorkoutsState();
}

class _AllWorkoutsState extends State<AllWorkouts> {
  List<PhotoAlbum>? _photoAlbum;
  bool? _loading;

  @override
  void initState() {
    _loading = true;
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
          "ALL WORKOUTS",
          style: TextStyle(
              fontSize: 15.8, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: CustomRefreshWidget(
        onLoading: () {
          return JsonParseService.getData().then((value) {
            setState(() {
              _photoAlbum = value;
            });
          });
        },
        widget: const Padding(
          padding: EdgeInsets.only(top: 30),
          child: Center(
              child: SpinKitThreeBounce(
            color: Colors.orangeAccent,
            size: 26,
          )),
        ),
        child: Column(
          children: [
            Center(
              child: Text(_loading! ? "Loading...." : "comming soon"),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 280,
              child: _loading == false && _photoAlbum!.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        PhotoAlbum albumData = _photoAlbum![index];
                        return RandomTile(
                          pic: albumData.thumbnailUrl,
                          brandName: albumData.title,
                          itemName: albumData.id.toString(),
                          prevPrice: albumData.albumId.toString(),
                          price: albumData.id.toString(),
                          ratings: albumData.albumId.toString(),
                        );
                      })
                  : const Center(child: CircularProgressIndicator()),
            )
          ],
        ),
      ),
    );
  }
}

class RandomTile extends StatelessWidget {
  final VoidCallback? ontap;
  final String? pic, brandName, itemName, ratings, price, prevPrice;
  const RandomTile(
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
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(
                      left: 10, right: 5, top: 4, bottom: 4),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(232, 44, 44, 44),
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: const Text(
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
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  brandName!,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 39, 39, 39),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
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
                  ratings!,
                  style: const TextStyle(
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Text(
                  price!,
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
