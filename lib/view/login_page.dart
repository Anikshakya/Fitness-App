// ignore_for_file: prefer_const_constructors

import 'package:fitness/view/bottomnav.dart';
import 'package:fitness/view/forgot_password.dart';
import 'package:fitness/view/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (conext) {
            return AlertDialog(
              title: Text("Do you want to quit?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('This will exit the app.'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                TextButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );

        return true;
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 221, 221, 221),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Image(
                  image: AssetImage("images/svg.png"),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        IconButton(
                          iconSize: 32,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (conext) {
                                return AlertDialog(
                                  title: Text("Do you want to quit?"),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: const <Widget>[
                                        Text('This will exit the app.'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Yes'),
                                      onPressed: () {
                                        SystemNavigator.pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('No'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.output_rounded),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text(
                        "Login to discover amazing things!",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // Image.asset(
                    //   "images/logo.png",
                    //   width: 200,
                    //   height: 200,
                    // ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      // color: Colors.white,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(232, 186, 187, 187),
                            offset: Offset(8, 8),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 40, bottom: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email,
                                size: 18,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),

                              // hintText: 'Enter your username',
                              labelText: 'Email',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 102, 102, 102),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            obscureText: _obscureText,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                size: 20,
                                color: Colors.grey,
                              ),

                              suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              // hintText: 'Enter your username',
                              labelText: 'Password',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 102, 102, 102),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BottomNav(index: 0),
                                ),
                              );
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                fixedSize: const Size(350, 45),
                                textStyle: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                                primary:
                                    const Color.fromARGB(255, 255, 255, 255),
                                onPrimary: Colors.black),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPassword(),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an Account?",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ),
                            );
                          },
                          child: Text(
                            "Create an Account",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Divider(
                          indent: 45,
                          endIndent: 45,
                          color: Color.fromARGB(255, 136, 136, 136),
                          thickness: 1,
                        ),
                        Container(
                          color: Color.fromARGB(255, 221, 221, 221),
                          margin: EdgeInsets.only(left: 150),
                          padding: EdgeInsets.all(2),
                          child: Text("Or Login using"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 82,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(232, 186, 187, 187),
                            offset: Offset(8, 8),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/facebook.png",
                            height: 60,
                            width: 60,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            "images/google.png",
                            height: 64,
                            width: 64,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            "images/twitter.png",
                            height: 54,
                            width: 54,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
