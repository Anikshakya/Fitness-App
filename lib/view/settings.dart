// ignore_for_file: prefer_const_constructors
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/view/bottomnav.dart';
import 'package:fitness/view/notifications.dart';
import 'package:fitness/view/permissions.dart';
import 'package:fitness/view/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'change_password.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  var user = FirebaseAuth.instance.currentUser;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "SETTINGS",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 10),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child:
                                        fireStoreItems[0]['profilePhoto'] != ""
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
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        fireStoreItems[0]['name'],
                                        // overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                        user!.email!,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      child: Text(
                                        fireStoreItems[0]['contact'],
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            //----Notifications
            SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Notifications()),
                  ),
                );
              },
              child: Container(
                height: 60,
                padding: EdgeInsets.only(left: 6),
                decoration: containerDecoration(),
                child: Row(
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 10, right: 14),
                          child: Icon(
                            Icons.notifications,
                            size: 19,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                        Text(
                          "Notifications",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 19,
                      color: Color.fromARGB(255, 116, 116, 116),
                    ),
                  ],
                ),
              ),
            ),
            //----Accounts
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 12, left: 10),
              decoration: containerDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 14, left: 8, right: 8, bottom: 5),
                    child: Text(
                      "ACCOUNT",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => BottomNav(index: 3)),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.person_pin,
                              size: 19,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 10, right: 14),
                          child: Icon(
                            Icons.business_rounded,
                            size: 19,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                        Text(
                          "Bussiness Profile",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ChangePassword()),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 8, bottom: 8, left: 10, right: 14),
                              child: Icon(
                                Icons.security,
                                size: 19,
                                color: Color.fromARGB(255, 116, 116, 116),
                              )),
                          Text(
                            "Security",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //---settings
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 12, left: 10),
              decoration: containerDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 14, left: 8, right: 8, bottom: 5),
                    child: Text(
                      "SETTINGS",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Utils.showSnackBar(
                          "No language available at the moment", false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.language_rounded,
                              size: 19,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                          Text(
                            "Language",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Permissions()),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.back_hand_outlined,
                              size: 19,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                          Text(
                            "Permissions",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //----More
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 12, left: 10),
              decoration: containerDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 14, left: 8, right: 8, bottom: 5),
                    child: Text(
                      "MORE",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      String telSupport = "tel:+977 9861333461";
                      launchUrl(Uri.parse(telSupport));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.phone_in_talk,
                              size: 19,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                          Text(
                            "Support",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      String googlePlayLaunch =
                          "market://details?id=com.westbund.heros";
                      launchUrl(Uri.parse(googlePlayLaunch));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.star,
                              size: 19,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                          Text(
                            "Rate Us",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      String feedbackEmail =
                          "mailto:aniklinkin@gmail.com?subject=Feedback to FitnessGhar&body=";
                      launchUrl(Uri.parse(feedbackEmail));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.feedback_rounded,
                              size: 19,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                          Text(
                            "Feedback",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 10, right: 14),
                          child: Icon(
                            Icons.domain_verification_sharp,
                            size: 19,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                        Text(
                          "Terms & Policy",
                          style: TextStyle(
                            color: Color.fromARGB(255, 116, 116, 116),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          title: Text("About Us"),
                          content: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Fitness Ghar provides innovative apps and services that track and manage health and fitness data to motivate individuals to get in shape, stay healthyy and improve overall fitness. We put quality at the core of everything we do, and this reflects not only in our product but also in our team spirit and collaborations.",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    "Developer Contact",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 129, 129, 129),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    "aniklinkin@gmail.com",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 129, 129, 129),
                                        fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    "+977 9863021878",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 129, 129, 129),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Text(
                                    "Jhatapol, Lalitpur",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 129, 129, 129),
                                        fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8, bottom: 8, left: 10, right: 14),
                            child: Icon(
                              Icons.info_outline_rounded,
                              size: 19,
                              color: Color.fromARGB(255, 75, 75, 75),
                            ),
                          ),
                          Text(
                            "About Us",
                            style: TextStyle(
                              color: Color.fromARGB(255, 116, 116, 116),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //----Links to Social Media----
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => launchUrlString(
                            "https://www.facebook.com/aniklinkin0.9"),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 8, bottom: 5),
                          child: FaIcon(
                            FontAwesomeIcons.facebook,
                            size: 28,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => launchUrlString(
                            "https://www.instagram.com/anik_shakya_/"),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 8, bottom: 5),
                          child: FaIcon(
                            FontAwesomeIcons.instagram,
                            size: 28,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => launchUrlString(
                            "https://www.youtube.com/channel/UCN8yO9CrdPjLO23wi7wQBfg"),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 8, bottom: 5),
                          child: FaIcon(
                            FontAwesomeIcons.youtube,
                            size: 28,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          launchUrlString("https://www.twitter.com");
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 8, bottom: 5),
                          child: FaIcon(
                            FontAwesomeIcons.twitter,
                            size: 28,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Developed by WeebTech",
                      style: TextStyle(
                        color: Color.fromARGB(255, 156, 156, 156),
                        fontSize: 13.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Version 1.0.0",
                      style: TextStyle(
                        color: Color.fromARGB(255, 151, 151, 151),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
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
