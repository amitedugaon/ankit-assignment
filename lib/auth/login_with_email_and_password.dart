import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../pages/home_screen.dart';

Future<void> loginWithEmailPassword(String email, String password,BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    Get.offAll(() => const HomeScreen());
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Navigator.pop(context);
     Fluttertoast.showToast(msg: "User not found");
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "wrong-password");

    }
  }
}