// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:fitness/view/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // File? image;
  var imagePermanent;
  final box = GetStorage();

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // final imageTemporary = File(image.path);
      setState(() {
        imagePermanent = image.path;
        box.write("a", imagePermanent);
        // this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Failed to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (conext) {
                return AlertDialog(
                  title: const Text("Unsaved changes"),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: const <Widget>[
                        Text('Are you sure you want to cancel?'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('No'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: const Text('Yes'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNav(index: 2),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.cancel),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 79,
                  backgroundColor: Colors.teal,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: box.read("a") != null
                        ? Image.file(
                            File(box.read("a")),
                            height: 154,
                            width: 154,
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
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 45,
                // width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  child: const Text('Change Profile Photo'),
                  style: ElevatedButton.styleFrom(
                    // shape: BorderRadius.circular(20),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 160,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    pickImage(ImageSource.camera);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      padding: const EdgeInsets.all(20)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.camera_alt,
                                        color: Colors.teal,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Upload image from Camera',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      padding: const EdgeInsets.all(20)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.image,
                                        color: Colors.teal,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Upload image from Gallery',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    pickImage(ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: Color.fromARGB(255, 37, 37, 37),
              ),
              //------Form------
              Container(
                padding: const EdgeInsets.only(
                    top: 15, left: 20, right: 20, bottom: 40),
                child: Column(
                  children: [
                    Form(
                      // key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person_outlined,
                                size: 18,
                              ),
                              iconColor: Colors.teal,
                              hintText: 'Enter your username',
                              labelText: 'Username',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 102, 102, 102),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              prefixIcon: const Icon(
                                Icons.person,
                                size: 18,
                              ),
                              iconColor: Colors.grey,
                              hintText: 'Enter your name',
                              labelText: 'Name',
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 102, 102, 102),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              prefixIcon: const Icon(
                                Icons.call,
                                size: 18,
                              ),
                              iconColor: Colors.grey,
                              hintText: 'Enter your phone number',
                              labelText: 'Contact',
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 102, 102, 102),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              prefixIcon: const Icon(
                                Icons.date_range_rounded,
                                size: 18,
                              ),
                              iconColor: Colors.grey,
                              hintText: 'Enter your date of birth',
                              labelText: 'D.O.B',
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 102, 102, 102),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(top: 40.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text("Submit"),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(90, 40),
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                  primary:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  onPrimary: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
