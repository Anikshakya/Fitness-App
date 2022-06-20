// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Permissions extends StatefulWidget {
  const Permissions({Key? key}) : super(key: key);

  @override
  State<Permissions> createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  bool locationSwitch = false;
  bool cameraSwitch = false;
  bool gallerySwitch = false;
  bool performanceSwitch = false;
  var status = Permission.location.serviceStatus;

  containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(232, 186, 187, 187),
          offset: Offset(0, 2),
          blurRadius: 5,
        ),
      ],
    );
  }

  @override
  void initState() {
    checkStatus();
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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "PERMISSIONS",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.8,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          //----Location Permission
          Container(
            padding: const EdgeInsets.only(bottom: 15, left: 10, top: 15),
            decoration: containerDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 10, right: 20),
                          child: Icon(
                            Icons.location_on,
                            size: 26,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Location Access",
                              style: TextStyle(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 49, 49, 49),
                              ),
                            ),
                            Text(
                              "For better delivery experience",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 116, 116, 116),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Switch(
                            activeColor: Colors.teal,
                            value: locationSwitch,
                            onChanged: (value) async {
                              setState(() {
                                locationSwitch = value;
                              });
                              locationSwitch
                                  ? locationPermission(value)
                                  : openAppSettings()
                                      .then((x) => checkStatus());
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          //----Camera permission
          Container(
            padding: const EdgeInsets.only(bottom: 15, left: 10, top: 15),
            decoration: containerDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 8, bottom: 8, left: 10, right: 20),
                        child: Icon(
                          Icons.camera_alt,
                          size: 26,
                          color: Color.fromARGB(255, 116, 116, 116),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Camera Access",
                            style: TextStyle(
                              fontSize: 17.5,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 49, 49, 49),
                            ),
                          ),
                          Text(
                            "Capture images from camera",
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 116, 116, 116),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Switch(
                          activeColor: Colors.teal,
                          value: cameraSwitch,
                          onChanged: (value) async {
                            setState(() {
                              cameraSwitch = value;
                            });
                            cameraSwitch
                                ? cameraPermission(value)
                                : openAppSettings().then((x) => checkStatus());
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          //----Gallery permission
          Container(
            padding: const EdgeInsets.only(bottom: 15, left: 10, top: 15),
            decoration: containerDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 10, right: 20),
                          child: Icon(
                            Icons.image_rounded,
                            size: 26,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Gallery Access",
                              style: TextStyle(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 49, 49, 49),
                              ),
                            ),
                            Text(
                              "Pick an image from gallery",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 116, 116, 116),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Switch(
                            activeColor: Colors.teal,
                            value: gallerySwitch,
                            onChanged: (value) {
                              setState(() {
                                gallerySwitch = value;
                              });
                              gallerySwitch
                                  ? galleryPermission(value)
                                  : openAppSettings()
                                      .then((x) => checkStatus());
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          //----Device Status
          Container(
            padding: const EdgeInsets.only(bottom: 15, left: 10, top: 15),
            decoration: containerDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, left: 10, right: 14),
                          child: Icon(
                            Icons.speed,
                            size: 26,
                            color: Color.fromARGB(255, 116, 116, 116),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Device State",
                              style: TextStyle(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 49, 49, 49),
                              ),
                            ),
                            Text(
                              "For better performance",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 116, 116, 116),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Switch(
                            activeColor: Colors.teal,
                            value: performanceSwitch,
                            onChanged: (value) {
                              setState(() {
                                performanceSwitch = value;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future locationPermission(value) async {
    await Permission.location.request().then((x) => checkStatus());
  }

  Future cameraPermission(value) async {
    await Permission.camera.request().then((x) => checkStatus());
  }

  Future galleryPermission(value) async {
    await Permission.storage.request().then((x) => checkStatus());
  }

  checkStatus() async {
    var locationStatus = await Permission.location.status;
    var cameraStatus = await Permission.camera.status;
    var galleryStatus = await Permission.storage.status;

    //----for location----
    if (locationStatus.isGranted) {
      setState(() {
        locationSwitch = true;
      });
    } else {
      setState(() {
        locationSwitch = false;
      });
    }

    //----for camera----
    if (cameraStatus.isGranted) {
      setState(() {
        cameraSwitch = true;
      });
    } else {
      setState(() {
        cameraSwitch = false;
      });
    }

    //----for gallery----
    if (galleryStatus.isGranted) {
      setState(() {
        gallerySwitch = true;
      });
    } else {
      setState(() {
        gallerySwitch = false;
      });
    }
  }
}
