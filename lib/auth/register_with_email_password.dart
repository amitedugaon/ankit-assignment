import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../pages/home_screen.dart';

Future<void> registerWithEmailPassword(String emailAddress, String password,BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    Get.offAll(() => const HomeScreen());
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Fluttertoast.showToast(msg: "please set a strong password");
      Navigator.pop(context);
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      Navigator.pop(context);

      Fluttertoast.showToast(msg: "email-already-in-use");

      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
