import 'package:fitness/main.dart';
import 'package:fitness/view/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoogleSignInProvieder extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin(context) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      //sends name phone passoword and email to firestore
      await FirebaseFirestore.instance.collection("users").doc(user.email).set({
        'email': user.email,
        'name': user.displayName,
        'contact': "",
        'profilePhoto': user.photoUrl,
        'bio': "This is your bio",
      });
      Utils.showSnackBar("Logged in Successfully", true);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message.toString(), false);
    }

    notifyListeners();
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future logout() async {
    await googleSignIn.disconnect();
  }
}
