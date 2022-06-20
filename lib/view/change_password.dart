import 'package:fitness/services.dart/analytics_service.dart';
import 'package:fitness/view/login_page.dart';
import 'package:fitness/view/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _obscureText2 = true;
  bool _obscureText3 = true;
  final newPasswordController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;
  var newPassword = "";
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change Password",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Set a strong password using combination on letters, numbers and special characters.",
                    style: TextStyle(fontSize: 16),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: _obscureText2,
                    controller: newPasswordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? "Password should have more than 6 character"
                        : null,
                    cursorColor: const Color.fromARGB(255, 130, 137, 247),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      prefixIcon: const Icon(
                        Icons.security,
                        size: 19.5,
                        color: Color.fromARGB(255, 167, 166, 166),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: (() {
                          setState(() {
                            _obscureText2 = !_obscureText2;
                          });
                        }),
                        child: Icon(
                          _obscureText2
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 23,
                          color: const Color.fromARGB(255, 167, 166, 166),
                        ),
                      ),
                      labelText: 'New Password',
                      labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 167, 166, 166)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: _obscureText3,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) =>
                        value != null && value != newPasswordController.text
                            ? "Password does not match"
                            : null,
                    cursorColor: const Color.fromARGB(255, 130, 137, 247),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      prefixIcon: const Icon(
                        Icons.security,
                        size: 19.5,
                        color: Color.fromARGB(255, 167, 166, 166),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: (() {
                          setState(() {
                            _obscureText3 = !_obscureText3;
                          });
                        }),
                        child: Icon(
                          _obscureText3
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 23,
                          color: const Color.fromARGB(255, 167, 166, 166),
                        ),
                      ),
                      labelText: 'Confirm Password',
                      labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 167, 166, 166)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: changePassword,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.change_circle_outlined,
                          size: 20,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Change Password",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: const Size(200, 40),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                        primary: const Color.fromARGB(255, 253, 253, 253),
                        onPrimary: const Color.fromARGB(255, 53, 53, 53)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future changePassword() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return Utils.showSnackBar("An error occured", false);
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    setState(() {
      newPassword = newPasswordController.text.trim();
    });

    try {
      await currentUser!.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Utils.showSnackBar("You have sucessfully changed you password", true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (contect) => Login(
            analytics: AnalyticsService.analytics,
            observer: AnalyticsService.observer,
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message.toString(), false);
      Navigator.pop(context);
      Navigator.popUntil(context, (route) => route.isActive);
    }
  }
}
