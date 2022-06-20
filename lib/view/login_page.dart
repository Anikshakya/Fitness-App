// ignore_for_file: prefer_const_constructors
import 'package:email_validator/email_validator.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fitness/google_sign_in.dart';
import 'package:fitness/services.dart/analytics_service.dart';
import 'package:fitness/view/bottomnav.dart';
import 'package:fitness/view/forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/view/sign_up.dart';
import 'package:fitness/view/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class Login extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  const Login({Key? key, required this.analytics, required this.observer})
      : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  //-----Email & password editing value contoller-----
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //---Validator key----
  final formKey = GlobalKey<FormState>();
  final successKey = GlobalKey<ScaffoldMessengerState>();

  //-----Analytics-----
  Future sendCurrentScreenAnalytics() async {
    await AnalyticsService.analytics
        .setCurrentScreen(screenName: "login_screen");
  }

  @override
  void initState() {
    sendCurrentScreenAnalytics();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

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
      child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Something went wrong"),
              );
            } else if (snapshot.hasData) {
              return BottomNav(
                index: 0,
              );
            } else {
              return Scaffold(
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
                            GestureDetector(
                              onDoubleTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomNav(index: 0),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: const Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w800,
                                  ),
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
                              child: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (email) => email != null &&
                                              !EmailValidator.validate(email)
                                          ? "Enter a valid email"
                                          : null,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.email,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),

                                        // hintText: 'Enter your username',
                                        labelText: 'Email',
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                        ),
                                        labelStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 102, 102, 102),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      obscureText: _obscureText,
                                      controller: passwordController,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) =>
                                          value != null && value.isEmpty
                                              ? "Password cannot be empty"
                                              : null,
                                      keyboardType:
                                          TextInputType.visiblePassword,
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        // hintText: 'Enter your username',
                                        labelText: 'Password',
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Colors.grey),
                                        ),
                                        labelStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 102, 102, 102),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    ElevatedButton(
                                      onPressed: logIn,
                                      child: const Text(
                                        "LOGIN",
                                        style: TextStyle(
                                          fontSize: 15.8,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          fixedSize: const Size(350, 45),
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                          primary: const Color.fromARGB(
                                              255, 255, 255, 255),
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
                                            builder: (context) =>
                                                ForgotPassword(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      ),
                                    )
                                  ],
                                ),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w800),
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
                                  GestureDetector(
                                    onTap: () {
                                      final provider =
                                          Provider.of<GoogleSignInProvieder>(
                                              context,
                                              listen: false);
                                      provider.googleLogin(context);
                                    },
                                    child: Image.asset(
                                      "images/google.png",
                                      height: 64,
                                      width: 64,
                                    ),
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
              );
            }
          }),
    );
  }

//-----Login method for firebase-----
  Future logIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          )
          .then((value) => sendLoginInfo());
      Utils.showSnackBar("Logged in successfully", true);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message.toString(), false);
    }

    //----Navigator.of(context) not working-----
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  //----send analytics info----
  Future<void> sendLoginInfo() async {
    var user = FirebaseAuth.instance.currentUser;
    await widget.analytics.logEvent(
      name: 'User_Logins',
      parameters: <String, dynamic>{
        'user_id': user!.uid,
        'user_email': user.email,
      },
    );
  }
}
