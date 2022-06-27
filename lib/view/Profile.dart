// ignore_for_file: file_names, prefer_adjacent_string_concatenation, prefer_typing_uninitialized_variables
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fitness/all_data/all_workout_data.dart';
import 'package:fitness/google_sign_in.dart';
import 'package:fitness/services.dart/analytics_service.dart';
import 'package:fitness/view/category_views/category1.dart';
import 'package:fitness/view/category_views/category2.dart';
import 'package:fitness/view/category_views/category3.dart';
import 'package:fitness/view/login_page.dart';
import 'package:get_storage/get_storage.dart';
import 'package:fitness/view/edit_profile.dart';
import 'package:fitness/view/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  const Profile({Key? key, required this.analytics, required this.observer})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    _currentScreenAnalytics();
    super.initState();
  }

  var box = GetStorage();
  final user = FirebaseAuth.instance.currentUser;

  //-----Container decorartion-----
  containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(232, 186, 187, 187),
          offset: Offset(2, 2),
          blurRadius: 3,
        ),
      ],
    );
  }

  //----analytics----
  Future<void> _currentScreenAnalytics() async {
    AnalyticsService.analytics.setCurrentScreen(
        screenName: "profile_screen", screenClassOverride: "profile_screen");
  }

  Future _logOutAnalytics() async {
    AnalyticsService.analytics.logEvent(name: "User_Logout", parameters: {
      'user_email': user?.email,
      'user_id': user?.uid,
    });
  }

  //-----for Category-----
  int catListColor = 0xfff5f5f5;
  int onTapCatListColor = 0xffffffff;
  int? textSize;
  var categoryIndex = 0;
  var option = "Market";

  switchCategory() {
    switch (option) {
      case "Market":
        return Category1(name: option);

      case "News":
        return Category2(name: option);

      case "Games":
        return Category3(name: option);

      case "Food":
        return Category1(name: option);

      case "Sports":
        return Category1(name: option);
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text(
          "ACCOUNTS & SETTINGS",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      //---Drawer-----
      endDrawer: SafeArea(
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: const EdgeInsets.all(20),
            children: [
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text(
                  'Log Out',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Do you want to log out?'),
                      content: const Text('This will log you out'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () async {
                            final provider = Provider.of<GoogleSignInProvieder>(
                                context,
                                listen: false);
                            provider.logout();

                            _logOutAnalytics();

                            await FirebaseAuth.instance.signOut().then(
                                (value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login(
                                            analytics: widget.analytics,
                                            observer: widget.observer))));
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      //-----Body--------
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                decoration: containerDecoration(),
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .where('email', isEqualTo: user!.email)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text("No data found....");
                      } else {
                        List<QueryDocumentSnapshot<Object?>> fireStoreItems =
                            snapshot.data!.docs;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                children: [
                                  //----Avatar-------
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: InteractiveViewer(
                                            child: AlertDialog(
                                              titlePadding:
                                                  const EdgeInsets.all(0),
                                              title: fireStoreItems[0]
                                                          ['profilePhoto'] !=
                                                      ""
                                                  ? CachedNetworkImage(
                                                      imageUrl:
                                                          fireStoreItems[0]
                                                              ['profilePhoto'],
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.asset(
                                                      "images/profile.jpg",
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 68,
                                        backgroundColor: Colors.white,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: fireStoreItems[0]
                                                      ['profilePhoto'] !=
                                                  ""
                                              ? CachedNetworkImage(
                                                  imageUrl: fireStoreItems[0]
                                                      ['profilePhoto'],
                                                  height: 125,
                                                  width: 125,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  "images/profile.jpg",
                                                  height: 154,
                                                  width: 154,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          child: Text(
                                            fireStoreItems[0]['name'],
                                            // overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: Text(
                                            user!.email!,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 71, 71, 71)),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          child: Text(
                                            fireStoreItems[0]['contact'],
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 71, 71, 71)),
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  fireStoreItems[0]['bio'].toString(),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 20),
                              child: Row(
                                children: const [
                                  Text(
                                    "HEIGHT " + "180" + "cm",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 27, 27, 27),
                                      fontSize: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 14, right: 14),
                                    child: Text(
                                      "|",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 27, 27, 27),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "WEIGHT " + "65" + "kg",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 27, 27, 27),
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      // shape: BorderRadius.circular(20),
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => EditProfile(
                                            editName: fireStoreItems[0]['name'],
                                            editContact: fireStoreItems[0]
                                                ['contact'],
                                            editBio: fireStoreItems[0]['bio'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.edit,
                                            size: 15,
                                          ),
                                        ),
                                        Text('Edit Profile'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              //-----Category Section-----
              Container(
                decoration: containerDecoration(),
                child: Row(
                  children: [
                    SingleChildScrollView(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height / 2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: categoryList.length,
                          itemBuilder: (context, index) {
                            var data = categoryList[index];
                            return CategoryListTile(
                              onTap: () {
                                setState(() {
                                  option = data["name"].toString();
                                  categoryIndex = index;
                                });
                              },
                              image: data["image"],
                              name: data["name"],
                              color: categoryIndex == index
                                  ? onTapCatListColor
                                  : catListColor,
                              textSize:
                                  categoryIndex == index ? textSize : 12.0,
                              textColor: categoryIndex == index
                                  ? "0xff000000"
                                  : "0xff808080",
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      color: const Color(0xffffffff),
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height / 2,
                      child: switchCategory(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 40, top: 5, right: 40, bottom: 5),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "View All (90)",
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(20, 0),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(
                        fontSize: 14.5, fontWeight: FontWeight.w300),
                    primary: const Color.fromARGB(255, 41, 41, 41),
                    onPrimary: const Color.fromARGB(255, 230, 230, 230)),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class CategoryListTile extends StatefulWidget {
  final image, name, color, textSize, textColor;
  final VoidCallback? onTap;
  const CategoryListTile(
      {Key? key,
      this.image,
      this.name,
      this.onTap,
      this.color,
      this.textSize,
      this.textColor})
      : super(key: key);

  @override
  State<CategoryListTile> createState() => _CategoryListTileState();
}

class _CategoryListTileState extends State<CategoryListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: Color(widget.color),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.name,
              style: TextStyle(
                  fontSize: widget.textSize,
                  color: Color(int.parse(widget.textColor))),
            ),
          ],
        ),
      ),
    );
  }
}
