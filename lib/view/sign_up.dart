import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/services.dart/analytics_service.dart';
import 'package:fitness/view/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import '../main.dart';
import 'bottomnav.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<ScaffoldState> _messangerKey = GlobalKey<ScaffoldState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final contactController = TextEditingController();
  bool _obscureText = true;
  bool _obscureText2 = true;
  var dropDownValue = "Gender";
  var user = FirebaseAuth.instance.currentUser;

  final formKey = GlobalKey<FormState>();
  Future sendCurrentScreenAnalytics() async {
    await AnalyticsService.analytics
        .setCurrentScreen(screenName: "sign_up_screen");
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
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else if (snapshot.hasData) {
            return const BottomNav(
              index: 0,
            );
          } else {
            return Scaffold(
              key: _messangerKey,
              backgroundColor: const Color.fromARGB(255, 221, 221, 221),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Image.asset(
                        "images/svg.png",
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: IconButton(
                              iconSize: 30,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "To create an new account sign up below",
                              style: TextStyle(),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: const EdgeInsets.all(20),
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
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 40, bottom: 50),
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    textCapitalization:
                                        TextCapitalization.words,
                                    textInputAction: TextInputAction.next,
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        size: 18,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      iconColor: Colors.teal,
                                      hintText: 'Enter your Name',
                                      labelText: 'Full Name',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                      labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 102, 102, 102),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (email) => email != null &&
                                            !EmailValidator.validate(email)
                                        ? "Enter a valid email"
                                        : null,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.email,
                                        size: 18,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      iconColor: Colors.teal,
                                      hintText: 'Enter your Email',
                                      labelText: 'Email',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                      labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 102, 102, 102),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.next,
                                    controller: contactController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.phone,
                                        size: 18,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      iconColor: Colors.teal,
                                      hintText: 'Enter your Contact',
                                      labelText: 'Contact',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                      labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 102, 102, 102),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  DropdownButton<String>(
                                    value: dropDownValue,
                                    icon: const Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropDownValue = newValue!;
                                      });
                                    },
                                    items: <String>['Gender', 'Male', 'Female']
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    textInputAction: TextInputAction.next,
                                    obscureText: _obscureText,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) =>
                                        value != null && value.length < 6
                                            ? "Enter min 6 characters"
                                            : null,
                                    decoration: InputDecoration(
                                      suffix: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              _obscureText = !_obscureText;
                                            },
                                          );
                                        },
                                        child: Icon(
                                          _obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        size: 18,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      hintText: 'Enter your Password',
                                      labelText: 'Password',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                      labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 102, 102, 102),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    obscureText: _obscureText2,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) => value != null &&
                                            value != passwordController.text
                                        ? "Password does not match"
                                        : null,
                                    decoration: InputDecoration(
                                      suffix: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              _obscureText2 = !_obscureText2;
                                            },
                                          );
                                        },
                                        child: Icon(
                                          _obscureText2
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        size: 18,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      hintText: 'Re-Enter your Password',
                                      labelText: 'Confirm Password',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                      labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 102, 102, 102),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ElevatedButton(
                                    onPressed: signUpValidation,
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
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
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text("By sigining up you accept our"),
                                        Text(
                                          "Terms of Services and Privacy Policy",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                          maxLines: 2,
                                          // maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      //sends email and passeord to firebase auth
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim().toLowerCase(),
        password: passwordController.text.trim(),
      );
      //sends name phone passoword and email to firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(emailController.text.trim())
          .set({
            'email': emailController.text.trim().toLowerCase(),
            'name': nameController.text.trim(),
            'contact': contactController.text.trim(),
            'profilePhoto': "",
            'bio': "This is your bio",
            'gender': dropDownValue.trim(),
          })
          .then((value) => setUserProperties(dropDownValue.trim()))
          .then((value) => sendSignInInfo());
      Utils.showSnackBar("Sign up successful!", true);
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message.toString(), false);
      Navigator.pop(context);
      navigatorKey.currentState!.popUntil((route) => route.isActive);
    }

    navigatorKey.currentState!.popUntil((route) => route.isActive);
  }

  //----Analytics-----
  //---User Properties---
  Future setUserProperties(gender) async {
    await AnalyticsService.analytics.setUserId(id: user?.uid);
    await AnalyticsService.analytics.setUserProperty(
      name: "gender",
      value: gender,
    );
  }

  Future sendSignInInfo() async {
    await AnalyticsService.analytics
        .logEvent(name: "user_sign_in", parameters: {
      'email': emailController.text.trim().toLowerCase(),
    });
  }

  signUpValidation() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              contentPadding: const EdgeInsets.all(0),
              content: SizedBox(
                height: 450,
                child: WebViewPlus(
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (controller) {
                    controller.loadUrl("webpages/index.html");
                  },
                  javascriptChannels: {
                    JavascriptChannel(
                        name: 'Captcha',
                        onMessageReceived: (JavascriptMessage message) {
                          signUp();
                        })
                  },
                ),
              ),
            ));
  }
}
